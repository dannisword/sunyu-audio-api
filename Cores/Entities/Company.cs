

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
/// <summary>
/// 指派參加課程
/// </summary>
[Table("company_data")]
public class Company : EntityBase
{
    /// <summary>
    /// 公司名稱
    /// </summary>
    /// <value></value>
    public string Name { get; set; }

    public string Logo { get; set; }

    public string Domain { get; set; }

    public string Memo { get; set; }
    /// <summary>
    /// 刪除註記
    /// </summary>
    /// <value></value>
    public int DeleteTag { get; set; }
}