using Microsoft.EntityFrameworkCore;
using Sunyu.Audio.Cores.Entities;

namespace Sunyu.Audio.Cores.Infrastructure
{

    public class DatabaseContext : DbContext
    {
        private string connectString;

        public DbSet<UserInfo> UserInfos { get; set; }
        public DbSet<Course> Courses { get; set; }
        public DbSet<CourseAppendix> CourseAppendies { get; set; }
        public DbSet<CourseSignup> CourseSignups { get; set; }
        public DbSet<CourseDesignate> CourseDesignates { get; set; }
        public DbSet<CoursePlayRecord> CoursePlayRecords { get; set; }

        public DbSet<ViewHistory> ViewHistories { get; set; }

        public DbSet<ViewLog> ViewLogs { get; set; }

        public DbSet<CourseMap> CourseMaps { get; set; }

        public DbSet<Company> Companies { get; set; }

        public DatabaseContext(IConfiguration configuration) : base()
        {
            this.connectString = configuration.GetSection("ConnectionStrings")["DefaultConnection"];
        }
        public DatabaseContext(IConfiguration configuration, string name) : base()
        {
            this.connectString = configuration.GetSection("ConnectionStrings")[name];
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseMySql(this.connectString, Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.24-mysql"));
            }
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Course>()
            .HasMany(b => b.Appendiies)
            .WithOne()
            .HasForeignKey(p => p.CourseSeq)
            .HasConstraintName("course_appendix");

            /*
                        modelBuilder.Entity<CourseAppendix>()
                        .HasOne(p => p.History)
                        .WithOne(p => p.CourseAppendix)
                        .HasForeignKey<ViewHistory>(p => p.AppendixSeq);
            */
            /*
                         modelBuilder.Entity<Course>()
                         .HasMany(x=> x.PlayRecords)
                         .WithOne()
                         .HasForeignKey(p=>p.CourseSeq);*/

        }
    }
}