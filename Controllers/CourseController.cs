using Microsoft.AspNetCore.Mvc;
using Sunyu.Audio.Services;
using Sunyu.Audio.Cores.Entities;

namespace Sunyu.Audio.Controllers;

[Tags("課程")]
[ApiController]
[Route("v1/[controller]")]
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
    /// <param name="pageIndex"></param>
    /// <returns></returns>
    [HttpGet]
    public IActionResult Get(int? lecturerType, int pageIndex)
    {
        return this.Ok(this.service.Reads(null, lecturerType));
    }
    /// <summary>
    /// 課程明細
    /// </summary>
    /// <param name="seq"></param>
    /// <returns></returns>
    [HttpGet("{Seq}")]
    public IActionResult Get(int Seq)
    {
        return this.Ok(this.service.Read(Seq));
    }
    /// <summary>
    /// 繼續看
    /// </summary>
    /// <returns></returns>
    [HttpGet("Half")]
    public IActionResult Half()
    {
        var userSeq = 1;
        return this.Ok(this.service.Half(userSeq));
    }

    /// <summary>
    /// 我的課程
    /// </summary>
    /// <param name="userSeq"></param>
    /// <returns></returns>
    [HttpGet("Mine")]
    public IActionResult Mine()
    {
        var userSeq = 1;
        return this.Ok(this.service.Mine(userSeq));
    }
    /// <summary>
    /// 最新課程
    /// </summary>
    /// <param name="userSeq"></param>
    /// <returns></returns>
    [HttpGet("Last")]
    public IActionResult Last()
    {
        var userSeq = 1;
        return this.Ok(this.service.Last(userSeq));
    }
    /// <summary>
    /// 設定播放紀錄
    /// </summary>
    /// <param name="Seq"></param>
    /// <returns></returns>
    [HttpPut("{Seq}/{Unit}")]
    public IActionResult Play(int Seq, string Unit, CoursePlayRecord PlayRecord)
    {
        return this.Ok(this.service.Play(PlayRecord));
    }




    /// <summary>
    /// 新增課程
    /// </summary>
    /// <param name="entity"></param>
    /// <returns></returns>
    [HttpPost]
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
    [HttpPut("{Seq}")]
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
    [HttpDelete("{Seq}")]
    public IActionResult Delete(int Seq, Course entity)
    {
        return this.Ok(this.service.Delete(entity));
    }

}