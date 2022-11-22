using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
/// <summary>
/// 課程報名清單
/// </summary>
[Table("course_signup")]
public class CourseSignup : EntityBase
{
    public int CourseSeq { get; set; }

    public int SignUpUser { get; set; }

    public int? IsDesignate { get; set; }

    public int IsSignedIn { get; set; }

    public DateTime? IsSignInTime { get; set; }

    public int? IsSignedOut { get; set; }

    public DateTime? IsSignOutTime { get; set; }

    public string Memo { get; set; }
}