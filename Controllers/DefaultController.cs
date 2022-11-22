using System.IdentityModel.Tokens.Jwt;
using System.Text.Json;
using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;

using Sunyu.Audio.Cores.Entities;
using Sunyu.Audio.Cores.Models;

namespace Sunyu.Audio.Controllers;

[ApiController]
[Route("[controller]")]
public class DefaultController : ControllerBase
{

    public ClaimsIdentity Identity
    {
        get
        {
            return HttpContext.User.Identity as ClaimsIdentity;
        }
    }
    protected IConfiguration configuration;
    public DefaultController(IConfiguration configuration)
    {
        this.configuration = configuration;
    }
    /// <summary>
    /// 取得使用者資訊
    /// </summary>
    /// <param name="userSeq"></param>
    /// <returns></returns>
    [HttpGet("GetUserInfo")]
    public UserInfo GetUserInfo()
    {
        try
        {
            var data = this.User.Identity.Name;
            var user = JsonSerializer.Deserialize<UserInfo>(data);
            var exp = this.Identity.FindFirst("exp").Value;
            return user;
        }
        catch (Exception)
        {
            return null;
        }
    }

}