using System.Linq;
using Microsoft.EntityFrameworkCore;
using Sunyu.Audio.Cores.Entities;
using Sunyu.Audio.Cores.Infrastructure;
using System.Text.Json;

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

    public Course? Read(int seq)
    {
        using (var context = new DatabaseContext(this.config))
        {
            var course = context.Courses?
            .Where(p => p.Seq == seq)
            .Include(x => x.Appendiies)
            .FirstOrDefault();

            if (course != null)
            {
                course.ViewHistories = context.ViewHistories?.Where(p => p.CourseSeq == seq).ToList();
                //course.ViewHistories = context.ViewHistories.Where(p=>p.)
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

    public IEnumerable<dynamic> Last(int userSeq, int currentPage, int itemsPerPage)
    {
        using (var db = new DatabaseContext(this.config))
        {
            var lastAt = DateTime.Now.AddMonths(-3);

            var q = from a in db.Courses
                    join b in db.CourseDesignates on a.Seq equals b.CourseSeq
                    where a.StartTime >= lastAt
                    // 加上部門
                    select a;

            return q.Include(x => x.Appendiies).Skip((currentPage - 1) * itemsPerPage).Take(itemsPerPage).ToList();
        }
    }

    public IEnumerable<dynamic> Half(int userSeq, int currentPage, int itemsPerPage)
    {
        using (var db = new DatabaseContext(this.config))
        {
            var q = from a in db.Courses
                        //join b in db.CourseSignups on a.Seq equals b.CourseSeq
                        //where b.SignUpUser == userSeq
                    select a;

            return q.Include(x => x.Appendiies).Skip((currentPage - 1) * itemsPerPage).Take(itemsPerPage).ToList();
        }
    }

    public IEnumerable<dynamic> Mine(int userSeq, int currentPage, int itemsPerPage)
    {
        using (var db = new DatabaseContext(this.config))
        {
            var q = from a in db.Courses
                        //join b in db.CourseSignups on a.Seq equals b.CourseSeq
                        //where b.SignUpUser == userSeq
                    select a;

            return q.Include(x => x.Appendiies).Skip((currentPage - 1) * itemsPerPage).Take(itemsPerPage).ToList();
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

    public CourseDesignate? GetDesignate(int courseSeq)
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
            if (appendiies?.FirstOrDefault() == null)
            {
                return new ViewHistory();
            }
            return appendiies.FirstOrDefault();
        }
    }
    public int SetViewHistory(ViewHistory entity)
    {
        using (var context = new DatabaseContext(this.config))
        {
            var history = context.ViewHistories.Where(x => x.CourseSeq == entity.CourseSeq && x.AppendixSeq == entity.AppendixSeq).FirstOrDefault();
            if (history != null)
            {
                history.ModifyUser = 1;
                history.ModifyDate = DateTime.Now;
                history.ViewLastTime = entity.ViewLastTime;
                context.ViewHistories?.Update(history);
                return context.SaveChanges();
            }
            else
            {
                entity.CreatUser = 1;
                entity.CreatDate = DateTime.Now;
                context.ViewHistories?.Add(entity);
                return context.SaveChanges();
            }
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="userSeq"></param>
    /// <returns></returns>
    public User? GetUserInfo(int userSeq)
    {
        using (var context = new DatabaseContext(this.config))
        {
            JwtHelpers jw = new JwtHelpers(this.config);

            var user = context.Users?.Where(p => p.UserSeq == userSeq).FirstOrDefault();
            if (user != null)
            {
                var data = JsonSerializer.Serialize(user);
                user.Token = jw.GenerateToken(data);
            }
            return user;
        }
    }
}
