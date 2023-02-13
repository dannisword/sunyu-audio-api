using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
/// <summary>
/// 專家資料庫
/// </summary>
[Table("expert_data")]
public class ExpertData : EntityBase
{
    public string Name { get; set; }

    public string ExpertMemo { get; set; }

    public string ExpertImage { get; set; }

    public string ExpertImageType { get; set; }

    public string Area { get; set; }

    public int Gender { get; set; }

    public string Identity { get; set; }

    public string IdentityCard { get; set; }

    public string Birthday { get; set; }

    public string Diet { get; set; }

    public string Telephone { get; set; }

    public string Mobile { get; set; }

    public string Mail { get; set; }

    public string Address { get; set; }

    public string ServiceAgency { get; set; }

    public string JobTitle { get; set; }

    public string AgencyPhone { get; set; }

    public string AgencyAddress { get; set; }

    public string Expertise { get; set; }

    public string Memo { get; set; }

    public string Education { get; set; }

    public string Experience { get; set; }

    public string ProjectExperience { get; set; }

    public int DeleteTag { get; set; }

    [NotMapped]
    public string Image
    {
        get
        {
            //$"data:image/jpeg;base64,
            return $"data:image/jpeg;base64, {this.ExpertImage}";
        }
    }

}