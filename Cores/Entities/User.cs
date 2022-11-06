using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
[Table("user")]
public class User
{
    /// <summary>
    /// 
    /// </summary>
    public User()
    {
        this.UserWorkNum = "";
        this.UserName = "";
        this.UserAccount = "";
        this.UserPassword = "";
        this.UserMail = "";
    }
    /// <summary>
    /// 流水序
    /// </summary>
    /// <value></value>
    [Key]
    public int UserSeq { get; set; }
    /// <summary>
    /// 員工編號
    /// </summary>
    /// <value></value>
    public string UserWorkNum { get; set; }
    /// <summary>
    /// 使用者姓名
    /// </summary>
    /// <value></value>
    public string UserName { get; set; }
    /// <summary>
    /// 使用者帳號
    /// </summary>
    /// <value></value>
    public string UserAccount { get; set; }
    /// <summary>
    /// 使用者密碼
    /// </summary>
    /// <value></value>
    public string UserPassword { get; set; }
    /// <summary>
    /// UserRole
    /// </summary>
    /// <value></value>
    public int UserRole { get; set; }
    /// <summary>
    /// 使用者手機
    /// </summary>
    /// <value></value>
    public string? UserMobile { get; set; }
    /// <summary>
    /// 分機號碼
    /// </summary>
    /// <value></value>
    public string? Extension { get; set; }
    /// <summary>
    /// 使用者信箱
    /// </summary>
    /// <value></value>
    public string? UserMail { get; set; }
    /// <summary>
    /// 使用者單位 對應表unit
    /// </summary>
    /// <value></value>
    public int UserUnit { get; set; }
    /// <summary>
    /// 使用者職稱
    /// </summary>
    /// <value></value>
    public int? UserJobTitle { get; set; }
    /// <summary>
    /// 是否為管理職 0:否 1:部門主管 2:理級主管
    /// </summary>
    /// <value></value>
    public int? Management { get; set; }
    /// <summary>
    /// 到職日期
    /// </summary>
    /// <value></value>
    public DateTime? StratWorkDay { get; set; }
    /// <summary>
    /// 建立日期
    /// </summary>
    /// <value></value>
    public DateTime CreatDate { get; set; }
    /// <summary>
    /// 建立人 0:自行註冊
    /// </summary>
    /// <value></value>
    public int CreatUser { get; set; }
    /// <summary>
    /// 是否啟用 1:啟用 0:不啟用
    /// </summary>
    /// <value></value>
    public int IsActive { get; set; }
    /// <summary>
    /// 刪除註記
    /// </summary>
    /// <value></value>
    public int DeleteTag { get; set; }

    /// <summary>
    /// Token
    /// </summary>
    /// <value></value>
    [NotMapped]
    public string Token { get; set; }
}