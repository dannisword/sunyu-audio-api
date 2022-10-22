using Microsoft.AspNetCore.Mvc;

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
}