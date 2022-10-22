
using System.Text.Json.Serialization;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
public abstract class EntityBase
{
    /// 流水序
    /// </summary>
    /// <value></value>
    [Key]
    public int Seq { get; set; }
    /// <summary>
    /// 建立日期
    /// </summary>
    /// <value></value>
    [JsonIgnore]
    public DateTime CreatDate { get; set; }
    /// <summary>
    /// 建立人員Seq
    /// </summary>
    /// <value></value>
    [JsonIgnore]
    public int CreatUser { get; set; }
    /// <summary>
    /// 異動日期
    /// </summary>
    /// <value></value>
    [JsonIgnore]
    public DateTime? ModifyDate { get; set; }
    /// <summary>
    /// 異動人員Seq
    /// </summary>
    /// <value></value>
    [JsonIgnore]
    public int? ModifyUser { get; set; }

}