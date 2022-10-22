using Sunyu.Audio.Cores.Entities;

namespace Sunyu.Audio.Services;

public interface ICourseServices
{
    int Create(Course course);

    int Update(Course course);

    int Delete(Course course);

    Course? Read(int seq);

    IEnumerable<dynamic> Reads(int? seq, int? lecturerType);

    IEnumerable<dynamic> Last(int userSeq);

    IEnumerable<dynamic> Half(int userSeq);

    IEnumerable<dynamic> Mine(int userSeq);

    int Play(CoursePlayRecord record);

}