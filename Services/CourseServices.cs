using System.Linq;
using Microsoft.EntityFrameworkCore;
using Sunyu.Audio.Cores.Entities;
using Sunyu.Audio.Cores.Infrastructure;

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
            return context.Courses?
            .Where(p => p.Seq == seq)
            .Include(x => x.Appendiies)
            .FirstOrDefault();
        }
    }

    public IEnumerable<dynamic> Reads(int? seq, int? lecturerType)
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
            return q.ToList();
        }
    }

    public IEnumerable<dynamic> Last(int userSeq)
    {
        using (var db = new DatabaseContext(this.config))
        {
            var lastAt = DateTime.Now.AddMonths(-3);

            var q = from a in db.Courses
                    join b in db.CourseDesignates on a.Seq equals b.CourseSeq
                    where a.StartTime >= lastAt
                    // 加上部門
                    select a;

            return q.Include(x => x.Appendiies).ToList();
        }
    }

    public IEnumerable<dynamic> Half(int userSeq)
    {
        using (var db = new DatabaseContext(this.config))
        {
            var q = from a in db.Courses
                    join b in db.CourseSignups on a.Seq equals b.CourseSeq
                    where b.SignUpUser == userSeq
                    select a;

            return q.Include(x => x.Appendiies)
                    .Include(x => x.PlayRecords).ToList();
        }
    }

    public IEnumerable<dynamic> Mine(int userSeq)
    {
        using (var db = new DatabaseContext(this.config))
        {
            var q = from a in db.Courses
                    join b in db.CourseSignups on a.Seq equals b.CourseSeq
                    where b.SignUpUser == userSeq
                    select a;

            return q.Include(x => x.Appendiies).ToList();
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
}
