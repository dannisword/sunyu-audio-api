using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
/// <summary>
/// 專家資料庫
/// </summary>
[Table("recommend_class")]
public class RecommendClass
{
     [Key]
     public int Seq { get; set; }

     public string CourseCategory { get; set; }

     public string CourseSubcategory { get; set; }

     public string CourseTitle { get; set; }

     public string CourseTime { get; set; }

     public string Participants { get; set; }

     public string Deadline { get; set; }

     public string CourseIntroduction { get; set; }

     public string CourseURL { get; set; }

     public DateTime CreatDate { get; set; }
}