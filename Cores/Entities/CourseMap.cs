//指派參加課程
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
/// <summary>
/// 指派參加課程
/// </summary>
[Table("carousel_map")]
public class CourseMap : EntityBase
{
    public string Image { get; set; }

    public int IsActive { get; set; }

    public int DeleteTag { get; set; }
}