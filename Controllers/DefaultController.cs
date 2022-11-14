using Microsoft.AspNetCore.Mvc;
using System.IdentityModel.Tokens.Jwt;
using System.Text.Json;

using Sunyu.Audio.Cores.Entities;
using Sunyu.Audio.Cores.Models;

namespace Sunyu.Audio.Controllers;

[ApiController]
[Route("[controller]")]
public class DefaultController : ControllerBase
{
    protected IConfiguration configuration;
    public DefaultController(IConfiguration configuration)
    {
        this.configuration = configuration;
    }

    public User? GetUser()
    {
        try
        {
            var token = Request.Headers.Authorization;

            if (string.IsNullOrEmpty(token) == true)
            {
                return null;
            }

            var handler = new JwtSecurityTokenHandler();
            var accessToken = handler.ReadJwtToken(token);
            return JsonSerializer.Deserialize<User>(accessToken.Subject);
        }
        catch (Exception)
        {
            return null;
        }
    }
    public ResultModel IsAuthorization()
    {
        try
        {
            var resp = new ResultModel();
            var token = Request.Headers.Authorization;

            if (string.IsNullOrEmpty(token) == true)
            {
                return new ResultModel(ResultCode.Failed, "Authorization 驗證錯誤");
            }
            var handler = new JwtSecurityTokenHandler();
            var accessToken = handler.ReadJwtToken(token);
            var data = JsonSerializer.Deserialize<User>(accessToken.Subject);
            if (data == null)
            {
                return new ResultModel(ResultCode.Failed, "User 驗證錯誤");
            }
            resp.Data = data;
            return resp;
        }
        catch (Exception e)
        {
            return new ResultModel(ResultCode.Exception, e.Message);
        }


    }
}