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

    public double ViewLastTime { get; set; }

    public int DeleteTag { get; set; }

    //[NotMapped]
    //public CourseAppendix? CourseAppendix { get; set; }
}