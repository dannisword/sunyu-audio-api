namespace Sunyu.Audio.Cores.Models;

public class ResultModel
{
    public ResultCode ResultCode { get; set; }

    public string Message { get; set; }

    public Pageable PageRequest { get; set; }

    public dynamic Content { get; set; }

    public dynamic Data { get; set; }

    public ResultModel()
    {
        this.ResultCode = ResultCode.Success;
    }
    public ResultModel(ResultCode resultCode, string message)
    {
        this.ResultCode = resultCode;
        this.Message = message;
    }
    public ResultModel(ResultCode resultCode, bool isSuccess)
    {
        this.ResultCode = resultCode;
        this.Data = isSuccess;
    }
    public ResultModel(IEnumerable<dynamic> source)
    {
        if (source.Count() > 0)
        {
            this.ResultCode = ResultCode.Success;
        }
        else
        {
            this.ResultCode = ResultCode.Failed;
        }
        this.Content = source;
    }
}

public class Pageable
{
    public int PageNumber { get; set; }

    public int TotalPage { get; set; }


}