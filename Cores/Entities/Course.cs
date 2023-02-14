using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Sunyu.Audio.Cores.Entities;
/// <summary>
/// 課程清單
/// </summary>
[Table("course")]
public class Course : EntityBase
{
    /// <summary>
    /// 課程名稱
    /// </summary>
    /// <value></value>
    public string CourseName { get; set; }
    /// <summary>
    /// 課程編號西元年月日+2碼流水號
    /// </summary>
    /// <value></value>
    public string CourseNumber { get; set; }
    /// <summary>
    /// 
    /// </summary>
    /// <value></value>
    public string? CourseImage { get; set; }
    /// <summary>
    /// 
    /// </summary>
    /// <value></value>
    public string? CourseImageType { get; set; }
    /// <summary>
    /// 開始時間
    /// </summary>
    /// <value></value>
    public string? StartTime { get; set; }
    /// <summary>
    /// 結束時間
    /// </summary>
    /// <value></value>
    public string? EndTime { get; set; }
    /// <summary>
    /// 職能類別
    /// </summary>
    /// <value></value>
    public int FunctionCategory { get; set; }
    /// <summary>
    /// 訓練目的
    /// </summary>
    /// <value></value>
    public int? TrainingGoal { get; set; }
    /// <summary>
    /// 其他訓練目的
    /// </summary>
    /// <value></value>
    public string? OtherTrainingGoal { get; set; }
    /// <summary>
    /// 講師類型 1:內部 2:外部
    /// </summary>
    /// <value></value>
    public int LecturerType { get; set; }
    /// <summary>
    /// 內部講師Seq
    /// </summary>
    /// <value></value>
    public int? Lecturer { get; set; }
    /// <summary>
    /// 外部講師Seq
    /// </summary>
    /// <value></value>
    public int? OtherLecturer { get; set; }
    /// <summary>
    /// 訓練對象 對應表:training_object
    /// </summary>
    /// <value></value>
    public int TrainingObject { get; set; }
    /// <summary>
    /// 其他訓練對象
    /// </summary>
    /// <value></value>
    public string? OtherTrainingObject { get; set; }
    /// <summary>
    /// 報名方法 0:限制報名 1:公開報名 2:必修
    /// </summary>
    /// <value></value>
    public int OpenSignUp { get; set; }
    /// <summary>
    /// 開放外部報名 0:不開放 1:開放
    /// </summary>
    /// <value></value>
    public int AllowExternal { get; set; }
    /// <summary>
    /// 滿意度調查表
    /// </summary>
    /// <value></value>
    public int CourseSurvey1 { get; set; }
    /// <summary>
    /// 訓後成效追蹤表
    /// </summary>
    /// <value></value>
    public int CourseSurvey2 { get; set; }
    /// <summary>
    /// 課後行動方案
    /// </summary>
    /// <value></value>
    public int CourseSurvey3 { get; set; }
    /// <summary>
    /// 課程簡介
    /// </summary>
    /// <value></value>
    public string? CourseMemo { get; set; }
    /// <summary>
    /// 作者姓名
    /// </summary>
    /// <value></value>
    public string? AuthorName { get; set; }
    /// <summary>
    /// 作者介紹
    /// </summary>
    /// <value></value>
    public string? AuthorMemo { get; set; }
    /// <summary>
    /// 
    /// </summary>
    /// <value></value>
    public string? AuthorImage { get; set; }
    /// <summary>
    /// 
    /// </summary>
    /// <value></value>
    public string? AuthorImageType { get; set; }
    /// <summary>
    /// 課程重點
    /// </summary>
    /// <value></value>
    public string? CourseFocus { get; set; }
    /// <summary>
    /// 課程發佈狀態 1:發佈 0:未發佈
    /// </summary>
    /// <value></value>
    public int CourseRelease { get; set; }
    /// <summary>
    /// 
    /// </summary>
    /// <value></value>
    public string? ReleaseDate { get; set; }

    /// <summary>
    /// 刪除註記
    /// </summary>
    /// <value></value>
    public int DeleteTag { get; set; }

    /// <summary>
    /// 課程附件
    /// </summary>
    /// <value></value>
    //[InverseProperty("course_appendix")]
    [NotMapped]
    public ICollection<CourseAppendix> Appendiies { get; set; }
    /// <summary>
    /// 播放紀錄
    /// </summary>
    /// <value></value>
    //[NotMapped]
    public ICollection<ViewHistory> ViewHistories { get; set; }
    /// <summary>
    /// 觀看比例
    /// </summary>
    /// <value></value>
    [NotMapped]
    public string Scale { get; set; }
    /// <summary>
    /// 課程圖檔
    /// </summary>
    /// <value></value>
    [NotMapped]
    public string CourseImageBase46
    {
        get
        {
            return $"data:image/jpeg;base64, {this.CourseImage}";
        }
    }
    /// <summary>
    /// 作者圖檔
    /// </summary>
    /// <value></value>
    [NotMapped]
    public string AuthorImageBase64 { get; set; }

}