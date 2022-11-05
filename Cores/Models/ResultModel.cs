namespace Sunyu.Audio.Cores.Models;

public class ResultModel
{
    public int ResultCode { get; set; }

    public string? Message { get; set; }

    public Pageable? PageRequest { get; set; }

    public dynamic? Content { get; set; }


}

public class Pageable
{
    public int PageNumber { get; set; }

    public int TotalPage { get; set; }

    
}