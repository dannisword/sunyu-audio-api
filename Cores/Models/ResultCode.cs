namespace Sunyu.Audio.Cores.Models;

public enum ResultCode
{
    /// <summary>
    /// 成功
    /// </summary>
    Success = 10,
    /// <summary>
    /// 查無資料
    /// </summary>
    NotFound = 20,
    /// <summary>
    /// 失敗
    /// </summary>
    Failed = 90,
    /// <summary>
    /// Exception
    /// </summary>
    Exception = 99
}