using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

using Sunyu.Audio.Services;
using Sunyu.Audio.Cores.Entities;
using Sunyu.Audio.Cores.Models;

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
    [HttpGet("Course/"), Authorize]
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
        var resp = new ResultModel();
        if (this.Identity.IsAuthenticated == false)
        {
            resp = new ResultModel(ResultCode.Failed, "驗證失敗");
            return this.Ok(resp);
        }
        var user = this.GetUserInfo();
        var source = this.service.Half(user, currentPage, itemsPerPage);
        var response = new ResultModel(source);
        return this.Ok(response);
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
        var resp = new ResultModel();
        if (this.Identity.IsAuthenticated == false)
        {
            resp = new ResultModel(ResultCode.Failed, "驗證失敗");
            return this.Ok(resp);
        }

        var user = this.GetUserInfo();
        var source = this.service.Mine(user, currentPage, itemsPerPage);
        var response = new ResultModel(source);

        return this.Ok(response);
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
        var resp = new ResultModel();
        if (this.Identity.IsAuthenticated == false)
        {
            resp = new ResultModel(ResultCode.Failed, "驗證失敗");
            return this.Ok(resp);
        }

        var user = this.GetUserInfo();

        var source = this.service.Last(user, currentPage, itemsPerPage);
        var response = new ResultModel(source);
        return this.Ok(response);
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
    /// 
    /// </summary>
    /// <param name="courseSeq"></param>
    /// <param name="appendixSeq"></param>
    /// <returns></returns>
    [HttpGet("Course/ViewHistory/{courseSeq}/{appendixSeq}")]
    public IActionResult GetViewHistory(int courseSeq, int appendixSeq)
    {
        var data = this.service.GetViewHistory(courseSeq, appendixSeq);

        return this.Ok(data);
    }
    /// <summary>
    /// 設定播放紀錄
    /// </summary>
    /// <param name="entity"></param>
    /// <returns></returns>
    [HttpPost("Course/ViewHistory")]
    public IActionResult SetViewHistory(ViewHistory entity)
    {
        var resp = new ResultModel();
        if (this.Identity.IsAuthenticated == false)
        {
            resp = new ResultModel(ResultCode.Failed, "驗證失敗");
            return this.Ok(resp);
        }

        var user = this.GetUserInfo();
        var eCode = this.service.SetViewHistory(entity, user);
        if (eCode <= 0)
        {
            resp = new ResultModel(ResultCode.Failed, "異動觀看紀錄失敗！");
        }
        resp.Content = entity;
        return this.Ok(resp);
    }

    /// <summary>
    /// 取的權限
    /// </summary>
    /// <param name="userSeq"></param>
    /// <returns></returns>
    [AllowAnonymous]
    [HttpGet("User/{userSeq}")]
    public IActionResult GetUser(int userSeq)
    {
        var resp = new ResultModel();

        var user = this.service.GetUserInfo(userSeq);
        if (user == null)
        {
            resp = new ResultModel(ResultCode.Failed, "驗證失敗！");
        }
        else
        {
            resp.Content = user;
        }
        return this.Ok(resp);
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
    /// <summary>
    /// 
    /// </summary>
    /// <returns></returns>
    [HttpGet("CourseTest")]
    public IActionResult Test()
    {
        return this.Ok("service is available");
    }
}