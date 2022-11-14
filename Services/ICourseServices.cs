using Sunyu.Audio.Cores.Entities;

namespace Sunyu.Audio.Services;

public interface ICourseServices
{
    int Create(Course course);

    int Update(Course course);

    int Delete(Course course);

    Course? Read(int seq);

    IEnumerable<dynamic> Reads(int? seq, int? lecturerType, int currentPage, int itemsPerPage);

    IEnumerable<dynamic> Last(User user, int currentPage, int itemsPerPage);

    IEnumerable<dynamic> Half(int userSeq, int currentPage, int itemsPerPage);

    IEnumerable<dynamic> Mine(User user, int currentPage, int itemsPerPage);

    int Play(CoursePlayRecord record);

    IEnumerable<CourseDesignate> GetDesignates();

    CourseDesignate GetDesignate(int courseSeq);

    int AddDesignate(CourseDesignate entity);

    int UpdateDesignate(CourseDesignate entity);

    dynamic GetViewHistories(int courseSeq);

    dynamic GetViewHistory(int courseSeq, int appendixSeq);

    int SetViewHistory(ViewHistory entity, User? user);

    User GetUserInfo(int userSeq);

}