using Microsoft.AspNetCore.Mvc;

namespace app.Controllers;

[Controller]
[Route("/")]
public class ApplicationController : ControllerBase
{
    private readonly ILogger<ApplicationController> _logger;

    public ApplicationController(ILogger<ApplicationController> logger)
    {
        _logger = logger;
    }

    [HttpGet]
    public String Get(String untrusted)
    {
        _logger.LogInformation(untrusted);
        _logger.LogInformation(Cleanse.CRLF(untrusted));

        HttpContext.Response.Headers.Add("untrusted", untrusted);
        HttpContext.Response.Headers.Add("untrusted-cleansed",Cleanse.CRLF(untrusted));

        return Cleanse.CRLF(untrusted);
    }
}
