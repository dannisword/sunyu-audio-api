using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
/// <summary>
/// 課程播放紀錄
/// </summary>
[Table("course_play_record")]
public class CoursePlayRecord : EntityBase
{
    public CoursePlayRecord()
    {
        this.Unit = "";
    }
    /// <summary>
    /// 課程序號
    /// </summary>
    /// <value></value>
    public int CourseSeq { get; set; }
    /// <summary>
    /// 課程單元
    /// </summary>
    /// <value></value>
    public string Unit { get; set; }
    /// <summary>
    /// 登入人員序號
    /// </summary>
    /// <value></value>
    public int SignUpUser { get; set; }
    /// <summary>
    /// 休息時過
    /// </summary>
    /// <value></value>
    public int PlayAt { get; set; }
}