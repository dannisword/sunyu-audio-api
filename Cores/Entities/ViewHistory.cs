using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
[Table("view_history")]
public class ViewHistory : EntityBase
{
    public int AppendixSeq { get; set; }

    public string? ViewLastTime { get; set; }

    public int DeleteTag { get; set; }

    //[NotMapped]
    //public CourseAppendix? CourseAppendix { get; set; }
}