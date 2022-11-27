using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
[Table("view_log")]
public class ViewLog
{
    [Key]
    public int Seq { get; set; }

    public int CourseSeq { get; set; }

    public int AppendixSeq { get; set; }

    public DateTime ViewStartTime { get; set; }

    public DateTime? ViewEndTime { get; set; }

    public DateTime CreatDate { get; set; }

    public int CreatUser { get; set; }
    
    public int DeleteTag { get; set; }
}