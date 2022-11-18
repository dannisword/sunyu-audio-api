using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
[Table("view_history")]
public class ViewHistory : EntityBase
{
    public ViewHistory()
    {

    }

    public int CourseSeq { get; set; }

    public int AppendixSeq { get; set; }

    public int UserSeq { get; set; }

    public double ViewLastTime { get; set; }

    public DateTime? FristViewTime { get; set; }

    public DateTime? FristFinishTime { get; set; }

    public int ViewFinishTag { get; set; }

    public int DeleteTag { get; set; }

    //[NotMapped]
    //public CourseAppendix? CourseAppendix { get; set; }
}