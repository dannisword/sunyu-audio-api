using System.IdentityModel.Tokens.Jwt;
using System.Text.Json;
using System.Security.Claims;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

using Sunyu.Audio.Cores.Entities;
using Sunyu.Audio.Cores.Models;
using Sunyu.Audio.Cores.Infrastructure;

namespace Sunyu.Audio.Controllers;

[Tags("基本資料")]
[ApiController]
[Route("v1/WebData")]
[Produces("application/json")]
public class WebDataController : DefaultController
{
    //private ICourseServices service;
    public WebDataController(IConfiguration configuration) : base(configuration)
    {
    }


    [HttpGet("Company/"), Authorize]
    public IActionResult GetCompany()
    {
        using (var db = new DatabaseContext(this.configuration, "WebDemoConnection"))
        {
            var company = db.Companies.FirstOrDefault();
            return this.Ok(company);
        }

    }
}