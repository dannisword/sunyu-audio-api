namespace Sunyu.Audio.Cores.Extensions;

public static class DateTimeExtensions
{
    public static string ToYYYYMMDD(this DateTime value)
    {
        return value.ToString("yyyy-MM-dd");
    }

    /// <summary>
    /// 時間轉換
    /// </summary>
    /// <param name="value"></param>
    /// <returns></returns>
    public static DateTime? ConvertTimestamp(this string value)
    {
        var stamp = 0;
        if (int.TryParse(value, out stamp) == true)
        {
            DateTime dateTime = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
            return dateTime.AddSeconds(stamp);
        }
        return null;
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="value"></param>
    /// <returns></returns>
    public static int ToInt(this string value)
    {
        int num = 0;
        if (int.TryParse(value, out num) == true)
        {
            return num;
        }
        return num;
    }
}