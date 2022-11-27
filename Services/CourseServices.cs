using System.Linq;
using System.Text.Json;
using Microsoft.EntityFrameworkCore;
using Sunyu.Audio.Cores.Entities;
using Sunyu.Audio.Cores.Infrastructure;
using Sunyu.Audio.Cores.Extensions;

namespace Sunyu.Audio.Services;

public class CourseServices : ICourseServices
{
    public IConfiguration config { get; set; }
    public CourseServices(IConfiguration config)
    {
        this.config = config;
    }
    public int Create(Course course)
    {
        using (var context = new DatabaseContext(this.config))
        {
            context.Courses?.Add(course);
            var code = context.SaveChanges();
            return code;
        }
    }

    public int Update(Course course)
    {
        using (var context = new DatabaseContext(this.config))
        {
            context.Courses?.Update(course);
            var code = context.SaveChanges();
            return code;
        }
    }

    public int Delete(Course course)
    {
        using (var context = new DatabaseContext(this.config))
        {
            context.Courses?.Remove(course);
            var code = context.SaveChanges();
            return code;
        }
    }

    public Course Read(int seq)
    {
        using (var context = new DatabaseContext(this.config))
        {
            var course = context.Courses?
            .Where(p => p.Seq == seq)
            .Include(x => x.Appendiies.Where(x => x.Type == 2))
            .FirstOrDefault();

            if (course != null)
            {
                course.ViewHistories = context.ViewHistories?.Where(p => p.CourseSeq == seq).ToList();
            }
            return course;
        }
    }

    public IEnumerable<dynamic> Reads(int? seq, int? lecturerType, int currentPage, int itemsPerPage)
    {
        using (var context = new DatabaseContext(this.config))
        {
            var q = from a in context.Courses
                    select a;
            if (seq != null)
            {
                q = q.Where(p => p.Seq == seq);
            }
            if (lecturerType != null)
            {
                q = q.Where(p => p.LecturerType == lecturerType);
            }

            return q.Skip((currentPage - 1) * itemsPerPage).Take(itemsPerPage).ToList();
        }
    }
    /// <summary>
    ///  最新上架
    /// </summary>
    /// <param name="User"></param>
    /// <param name="currentPage"></param>
    /// <param name="itemsPerPage"></param>
    /// <returns></returns>
    public IEnumerable<dynamic> Last(UserInfo user, int currentPage, int itemsPerPage)
    {
        using (var db = new DatabaseContext(this.config))
        {
            var lastAt = DateTime.Now.AddMonths(-3).ToYYYYMMDD();

            var q = from a in db.Courses
                    where a.OpenSignUp == 1 &&
                          a.CourseRelease == 1 &&
                          a.ReleaseDate != "" &&
                          a.ReleaseDate.CompareTo(lastAt) >= 0
                    orderby a.ReleaseDate descending
                    select a;
            return q.Include(x => x.Appendiies.Where(x => x.Type == 2))
                    .Skip((currentPage - 1) * itemsPerPage)
                    .Take(itemsPerPage).ToList();
        }
    }
    /// <summary>
    /// 繼續看
    /// </summary>
    /// <param name="userSeq"></param>
    /// <param name="currentPage"></param>
    /// <param name="itemsPerPage"></param>
    /// <returns></returns>
    public IEnumerable<dynamic> Half(UserInfo user, int currentPage, int itemsPerPage)
    {
        using (var db = new DatabaseContext(this.config))
        {
            var q = from a in db.Courses
                    join b in db.ViewHistories on a.Seq equals b.CourseSeq
                    where b.UserSeq == user.UserSeq &&
                          b.ViewFinishTag == 0
                    select a;
            return q.GroupBy(g => new
            {
                g.Seq,
                g.CourseName,
                g.CourseImage,
                g.CourseImageType,
                g.CourseMemo,
                g.AuthorName,
                g.AuthorMemo,
                g.AuthorImage,
                g.AuthorImageType,
                g.CourseFocus

            }).Select(x => new
            {
                x.Key.Seq,
                x.Key.CourseName,
                x.Key.CourseImage,
                x.Key.CourseImageType,
                x.Key.CourseMemo,
                x.Key.AuthorName,
                x.Key.AuthorMemo,
                x.Key.AuthorImage,
                x.Key.AuthorImageType,
                x.Key.CourseFocus
            }).ToList();

        }
    }
    /// <summary>
    /// 全部課程
    /// </summary>
    /// <param name="userSeq"></param>
    /// <param name="currentPage"></param>
    /// <param name="itemsPerPage"></param>
    /// <returns></returns>
    public IEnumerable<dynamic> Mine(UserInfo user, int currentPage, int itemsPerPage)
    {
        using (var db = new DatabaseContext(this.config))
        {
            var q = from a in db.Courses
                    where a.OpenSignUp == 1 &&
                          a.CourseRelease == 1
                    orderby a.ReleaseDate descending
                    select a;

            return q.Include(x => x.Appendiies).Skip((currentPage - 1) * itemsPerPage).Take(itemsPerPage).ToList();
        }
    }

    public IEnumerable<dynamic> Self(UserInfo user, int currentPage, int itemsPerPage)
    {
        using (var db = new DatabaseContext(this.config))
        {
            var q = from a in db.Courses
                    join b in db.CourseSignups on a.Seq equals b.CourseSeq
                    where b.SignUpUser == user.UserSeq &&
                          a.CourseRelease == 1
                    orderby a.ReleaseDate descending
                    select a;

            var source = q.Include(x => x.Appendiies)
                          .Skip((currentPage - 1) * itemsPerPage)
                          .Take(itemsPerPage).ToList();
            // 計算比例
            foreach (var item in source)
            {
                var duration = item.Appendiies.Sum(x => x.Duration);
                var viewLastTime = db.ViewHistories.Where(x => x.CourseSeq == item.Seq &&
                                                          x.UserSeq == user.UserSeq)
                                                    .Sum(p => p.ViewLastTime);
                if (duration > 0)
                {
                    item.Scale = viewLastTime / duration * 100;
                }

            }
            return source;
        }

    }

    public int Play(CoursePlayRecord record)
    {
        using (var db = new DatabaseContext(this.config))
        {
            var q = db.CoursePlayRecords.Where(p =>
                    p.CourseSeq == record.CourseSeq &&
                    p.Unit == record.Unit &&
                    p.SignUpUser == record.SignUpUser).ToList();

            if (q.Any() == false)
            {
                record.CreatDate = DateTime.Now;
                record.CreatUser = 0;
                db.CoursePlayRecords.Add(record);
            }
            else
            {
                var data = q.FirstOrDefault();
                data.PlayAt = record.PlayAt;
                data.ModifyDate = DateTime.Now;
                data.ModifyUser = 0;
                db.CoursePlayRecords.Update(data);
            }

            return db.SaveChanges();
        }
    }

    public IEnumerable<CourseDesignate> GetDesignates()
    {
        using (var db = new DatabaseContext(this.config))
        {
            var q = from a in db.CourseDesignates
                        //join b in db.CourseSignups on a.Seq equals b.CourseSeq
                        //where b.SignUpUser == userSeq
                    select a;
            return q.ToList();
        }
    }

    public CourseDesignate GetDesignate(int courseSeq)
    {
        using (var context = new DatabaseContext(this.config))
        {
            return context.CourseDesignates?
            .Where(p => p.CourseSeq == courseSeq)
            .FirstOrDefault();
        }
    }

    public int AddDesignate(CourseDesignate entity)
    {
        using (var context = new DatabaseContext(this.config))
        {
            context.CourseDesignates?.Add(entity);
            var code = context.SaveChanges();
            return code;
        }
    }

    public int UpdateDesignate(CourseDesignate entity)
    {
        using (var context = new DatabaseContext(this.config))
        {
            context.CourseDesignates?.Update(entity);
            var code = context.SaveChanges();
            return code;
        }
    }

    public dynamic GetViewHistories(int courseSeq)
    {
        using (var context = new DatabaseContext(this.config))
        {
            var appendiies = context.CourseAppendies?.Where(p => p.CourseSeq == courseSeq).ToList();
            foreach (var appendix in appendiies)
            {
                var history = context.ViewHistories?.Where(p => p.AppendixSeq == appendix.Seq).FirstOrDefault();
                appendix.History = history == null ? new ViewHistory() : history;
            }
            return appendiies;
        }
    }

    public dynamic GetViewHistory(int courseSeq, int appendixSeq)
    {
        using (var context = new DatabaseContext(this.config))
        {
            var appendiies = context.ViewHistories?.Where(p => p.CourseSeq == courseSeq && p.AppendixSeq == appendixSeq);
            if (appendiies.FirstOrDefault() == null)
            {
                return new ViewHistory();
            }
            return appendiies.FirstOrDefault();
        }
    }
    public dynamic SetViewHistory(ViewHistory entity, UserInfo user)
    {
        using (var context = new DatabaseContext(this.config))
        {
            var history = context.ViewHistories?.Where(x => x.CourseSeq == entity.CourseSeq && x.AppendixSeq == entity.AppendixSeq).FirstOrDefault();
            if (history != null)
            {
                history.ModifyUser = user?.UserSeq;
                history.ModifyDate = DateTime.Now;
                history.ViewLastTime = entity.ViewLastTime;
                context.ViewHistories.Update(history);
                if (context.SaveChanges() > 0)
                {
                    return history;
                }
            }
            else
            {
                entity.UserSeq = user.UserSeq;
                entity.FristViewTime = DateTime.Now;
                entity.CreatUser = user.UserSeq;
                entity.CreatDate = DateTime.Now;
                context.ViewHistories.Add(entity);
                if (context.SaveChanges() > 0)
                {
                    return entity;
                }
            }
            return null;
        }
    }

    public dynamic SetViewHistoryEnd(UserInfo user, int seq)
    {
        using (var context = new DatabaseContext(this.config))
        {
            var history = context.ViewHistories?.Where(x => x.Seq == seq).FirstOrDefault();
            if (history == null)
            {
                return 0;
            }
            if (history.ViewFinishTag == 1)
            {
                return 0;
            }
            history.ModifyDate = DateTime.Now;
            history.ModifyUser = user.UserSeq;
            history.FristFinishTime = DateTime.Now;
            history.ViewFinishTag = 1;
            context.ViewHistories.Update(history);
            if (context.SaveChanges() > 0)
            {
                return history;
            }
            return null;
        }

    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="userSeq"></param>
    /// <returns></returns>
    public UserInfo GetUserInfo(int userSeq)
    {
        using (var context = new DatabaseContext(this.config))
        {
            JwtHelpers jw = new JwtHelpers(this.config);

            var user = context.UserInfos?.Where(p => p.UserSeq == userSeq).FirstOrDefault();
            if (user != null)
            {
                var data = JsonSerializer.Serialize(user);
                user.Token = jw.GenerateToken(data);
            }
            return user;
        }
    }
}
