using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using System.Text.Json;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;

using Sunyu.Audio.Cores.Infrastructure;
using Sunyu.Audio.Cores.Entities;
using Sunyu.Audio.Cores.Models;
using Sunyu.Audio.Cores.Extensions;

namespace Sunyu.Audio.Controllers;

[Tags("驗證")]
[ApiController]
[Route("v1/Verify")]
[Produces("application/json")]
[Authorize]
/// <summary>
/// 
/// </summary>
public class VerifyController : DefaultController
{
    public VerifyController(IConfiguration configuration) : base(configuration)
    {
    }
    [AllowAnonymous]
    [HttpGet("Token/{account}/{password}")]
    public IActionResult GetToken(string account, string password)
    {
        using (var context = new DatabaseContext(this.configuration))
        {
            var expiration = this.configuration.GetValue<string>("Expiration");
            var resp = new ResultModel();

            JwtHelpers jw = new JwtHelpers(this.configuration);
            var user = context.UserInfos.Where(x =>
                        x.UserAccount == account &&
                        x.UserPassword == password).FirstOrDefault();

            if (user != null)
            {
                var data = JsonSerializer.Serialize(user);
                user.Token = jw.GenerateToken(data, expiration.ToInt());
                user.Expiration = DateTime.Now.AddMinutes(expiration.ToInt());
                resp.Content = user;
            }
            else
            {
                resp.ResultCode = ResultCode.Failed;
                resp.Message = "驗證失敗！";

            }
            return this.Ok(resp);
        }
    }

    [HttpGet("GetUser")]
    public IActionResult GetUser()
    {
        var resp = new ResultModel();
   
        if (User.Identity.IsAuthenticated == false)
        {
            resp = new ResultModel(ResultCode.Failed, "驗證失敗");
            return this.Ok(resp);
        }
        var use = JsonSerializer.Deserialize<UserInfo>(User.Identity.Name);
        if (use == null)
        {
            resp = new ResultModel(ResultCode.Failed, "轉型失敗");
            return Ok(resp);
        }
        // Get Identity
        var identity = HttpContext.User.Identity as ClaimsIdentity;
        if (identity != null)
        {
            IEnumerable<Claim> claims = identity.Claims;
            var exp = identity.FindFirst("exp")?.Value;
            use.Expiration = exp.ConvertTimestamp();
        }
        resp.Content = use;
        return Ok(resp);
    }
    [AllowAnonymous]
    [HttpPost("Token")]
    // FromForm - from
    // FromBody
    public IActionResult Token([FromBody] SToken token)
    {
        var resp = new ResultModel();
        try
        {
            var handler = new JwtSecurityTokenHandler();
            var jwtToken = handler.ReadJwtToken(token.token);
            var sub = jwtToken.Claims.First(x => x.Type == "sub").Value;
            var exp = jwtToken.Claims.First(x => x.Type == "exp").Value;
            var dynamicObject = JsonSerializer.Deserialize<UserInfo>(sub);
            resp.Content = dynamicObject;
            dynamicObject.Expiration = exp.ConvertTimestamp();
            dynamicObject.Token = token.token;
            resp.Data = exp.ConvertTimestamp();
            return this.Ok(resp);
        }
        catch (Exception e)
        {
            resp = new ResultModel(ResultCode.Exception, e.Message);
            return this.Ok(resp);
        }
    }

    public class SToken
    {
        public string token { get; set; }
    }
}