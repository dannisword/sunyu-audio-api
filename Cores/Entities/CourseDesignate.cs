using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
/// <summary>
/// 指派參加課程
/// </summary>
[Table("course_designate")]
public class CourseDesignate : EntityBase
{
    /// <summary>
    /// 課程Seq
    /// </summary>
    /// <value></value>
    public int CourseSeq { get; set; }
    /// <summary>
    /// 指定部門
    /// </summary>
    /// <value></value>
    public int DivisionSeq { get; set; }
    /// <summary>
    /// 指定子部門
    /// </summary>
    /// <value></value>
    public int? SectionSeq { get; set; }
    /// <summary>
    /// 參加人數
    /// </summary>
    /// <value></value>
    public int AllowedCount { get; set; }
    /// <summary>
    /// 刪除註記
    /// </summary>
    /// <value></value>
    public int DeleteTag { get; set; }
}