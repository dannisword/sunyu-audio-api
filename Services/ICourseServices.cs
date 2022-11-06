using Sunyu.Audio.Cores.Entities;

namespace Sunyu.Audio.Services;

public interface ICourseServices
{
    int Create(Course course);

    int Update(Course course);

    int Delete(Course course);

    Course? Read(int seq);

    IEnumerable<dynamic> Reads(int? seq, int? lecturerType, int currentPage, int itemsPerPage);

    IEnumerable<dynamic> Last(int userSeq, int currentPage, int itemsPerPage);

    IEnumerable<dynamic> Half(int userSeq, int currentPage, int itemsPerPage);

    IEnumerable<dynamic> Mine(int userSeq, int currentPage, int itemsPerPage);

    int Play(CoursePlayRecord record);

    IEnumerable<CourseDesignate> GetDesignates();

    CourseDesignate GetDesignate(int courseSeq);

    int AddDesignate(CourseDesignate entity);

    int UpdateDesignate(CourseDesignate entity);

    dynamic GetViewHistories(int courseSeq);

    int SetViewHistory(ViewHistory entity);

    User GetUserInfo(int userSeq);

}