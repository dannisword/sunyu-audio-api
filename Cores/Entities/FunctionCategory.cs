using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
/// <summary>
/// 專家資料庫
/// </summary>
[Table("function_category")]
public class FunctionCategory
{
     [Key]
     public int Seq { get; set; }

     public string Name { get; set; }

    /// <summary>
    /// 刪除註記
    /// </summary>
    /// <value></value>
    public int DeleteTag { get; set; }
}