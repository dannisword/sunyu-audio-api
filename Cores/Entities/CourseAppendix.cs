using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
/// <summary>
/// 課程清單
/// </summary>
[Table("course_appendix")]
public class CourseAppendix : EntityBase
{
    public CourseAppendix()
    {
        this.Unit = "";
        this.FilePath = "";
        this.FileName = "";
        this.OriginalFileName = "";
        this.Memo = "";
        this.Tag = "";
    }

    /// <summary>
    /// 課程Seq
    /// </summary>
    /// <value></value>
    //[ForeignKey("course")]
    public int CourseSeq { get; set; }
    /// <summary>
    /// 課程類別
    /// </summary>
    /// <value></value>
    public int Type { get; set; }
    /// <summary>
    /// 課程Seq
    /// </summary>
    /// <value></value>
    public string Unit { get; set; }
    /// <summary>
    /// 單元數
    /// </summary>
    /// <value></value>
    public string FilePath { get; set; }
    /// <summary>
    /// 檔案路徑
    /// </summary>
    /// <value></value>
    public string FileName { get; set; }
    /// <summary>
    /// 檔案名稱
    /// </summary>
    /// <value></value>
    public string OriginalFileName { get; set; }
    /// <summary>
    /// 影片說明
    /// </summary>
    /// <value></value>
    public string Memo { get; set; }
    /// <summary>
    /// 標籤
    /// </summary>
    /// <value></value>
    public string Tag { get; set; }

    /// <summary>
    /// 刪除註記
    /// </summary>
    /// <value></value>
    public int DeleteTag { get; set; }
    /// <summary>
    /// 觀看紀錄
    /// </summary>
    /// <value></value>
    [NotMapped]
    public ViewHistory History { get; set; }
}