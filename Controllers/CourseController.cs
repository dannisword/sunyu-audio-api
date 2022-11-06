using Microsoft.AspNetCore.Mvc;
using Sunyu.Audio.Services;
using Sunyu.Audio.Cores.Entities;

namespace Sunyu.Audio.Controllers;

[Tags("課程")]
[ApiController]
[Route("v1/")]
[Produces("application/json")]
public class CourseController : DefaultController
{
    private ICourseServices service;
    public CourseController(
        IConfiguration configuration,
        ICourseServices service) : base(configuration)
    {
        this.service = service;
    }

    /// <summary>
    /// 所有課程
    /// </summary>
    /// <param name="lecturerType"></param>
    /// <param name="currentPage"></param>
    /// <param name="itemsPerPage"></param>
    /// <returns></returns>
    [HttpGet("Course/")]
    public IActionResult Get(int? lecturerType, int currentPage = 1, int itemsPerPage = 10)
    {
        return this.Ok(this.service.Reads(null, lecturerType, currentPage, itemsPerPage));
    }
    /// <summary>
    /// 課程明細
    /// </summary>
    /// <param name="seq"></param>
    /// <returns></returns>
    [HttpGet("Course/{Seq}")]
    public IActionResult Get(int Seq)
    {
        return this.Ok(this.service.Read(Seq));
    }
    /// <summary>
    /// 繼續看
    /// </summary>
    /// <param name="currentPage"></param>
    /// <param name="itemsPerPage"></param>
    /// <returns></returns>
    [HttpGet("Course/Half")]
    public IActionResult Half(int currentPage = 1, int itemsPerPage = 10)
    {
        var userSeq = 1;
        return this.Ok(this.service.Half(userSeq, currentPage, itemsPerPage));
    }

    /// <summary>
    /// 我的課程
    /// </summary>
    /// <param name="currentPage"></param>
    /// <param name="itemsPerPage"></param>
    /// <returns></returns>
    [HttpGet("Course/Mine")]
    public IActionResult Mine(int currentPage = 1, int itemsPerPage = 10)
    {
        var userSeq = 1;
        return this.Ok(this.service.Mine(userSeq, currentPage, itemsPerPage));
    }
    /// <summary>
    /// 最新課程
    /// </summary>
    /// <param name="currentPage"></param>
    /// <param name="itemsPerPage"></param>
    /// <returns></returns>
    [HttpGet("Course/Last")]
    public IActionResult Last(int currentPage = 1, int itemsPerPage = 10)
    {
        var userSeq = 1;
        return this.Ok(this.service.Last(userSeq, currentPage, itemsPerPage));
    }
    /// <summary>
    /// 設定播放紀錄
    /// </summary>
    /// <param name="Seq"></param>
    /// <param name="Unit"></param>
    /// <param name="PlayRecord"></param>
    /// <returns></returns>
    [HttpPut("Course/{Seq}/{Unit}")]
    public IActionResult Play(int Seq, string Unit, CoursePlayRecord PlayRecord)
    {
        return this.Ok(this.service.Play(PlayRecord));
    }
    /// <summary>
    /// 
    /// </summary>
    /// <returns></returns>
    [HttpGet("Course/Designates")]
    public IActionResult GetDesignates()
    {
        return this.Ok(this.service.GetDesignates());
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="courseSeq"></param>
    /// <returns></returns>
    [HttpGet("Course/Designate/{Seq}")]
    public IActionResult GetDesignate(int courseSeq)
    {
        return this.Ok(this.service.GetDesignate(courseSeq));
    }
    /// <summary>
    /// 新增指定課程
    /// </summary>
    /// <param name="entity"></param>
    /// <returns></returns>
    [HttpPost("Course/Designate")]
    public IActionResult AddDesignate(CourseDesignate entity)
    {
        return this.Ok(this.service.AddDesignate(entity));
    }
    /// <summary>
    /// 更新指定課程
    /// </summary>
    /// <param name="entity"></param>
    /// <returns></returns>
    [HttpPut("Course/Designate")]
    public IActionResult UpdateDesignate(CourseDesignate entity)
    {
        return this.Ok(this.service.AddDesignate(entity));
    }
    /// <summary>
    /// 取得播放紀錄
    /// </summary>
    /// <param name="courseSeq"></param>
    /// <returns></returns>
    [HttpGet("Course/ViewHistories/{courseSeq}")]
    public IActionResult GetViewHistories(int courseSeq)
    {
        return this.Ok(this.service.GetViewHistories(courseSeq));
    }

    /// <summary>
    /// 設定播放紀錄
    /// </summary>
    /// <param name="entity"></param>
    /// <returns></returns>
    [HttpPost("Course/ViewHistory")]
    public IActionResult SetViewHistory(ViewHistory entity)
    {
        entity.CreatDate = DateTime.Now;
        entity.CreatUser = 1;
        return this.Ok(this.service.SetViewHistory(entity));
    }

    /// <summary>
    /// 取的權限
    /// </summary>
    /// <param name="userSeq"></param>
    /// <returns></returns>
    [HttpGet("User/{userSeq}")]
    public IActionResult GetUser(int userSeq)
    {
        return this.Ok(this.service.getUserInfo(userSeq));
    }
    /// <summary>
    /// 新增課程
    /// </summary>
    /// <param name="entity"></param>
    /// <returns></returns>
    [HttpPost("Course/")]
    public IActionResult Post(Course entity)
    {
        return this.Ok(this.service.Create(entity));
    }
    /// <summary>
    /// 更新課程
    /// </summary>
    /// <param name="Seq"></param>
    /// <param name="entity"></param>
    /// <returns></returns>
    [HttpPut("Course/{Seq}")]
    public IActionResult Put(int Seq, Course entity)
    {
        return this.Ok(this.service.Update(entity));
    }
    /// <summary>
    /// 刪除課程
    /// </summary>
    /// <param name="Seq"></param>
    /// <param name="entity"></param>
    /// <returns></returns>
    [HttpDelete("Course/{Seq}")]
    public IActionResult Delete(int Seq, Course entity)
    {
        return this.Ok(this.service.Delete(entity));
    }

}