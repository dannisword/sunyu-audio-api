namespace Sunyu.Audio.Cores.Extensions;

public static class DateTimeExtensions
{
    public static string ToYYYYMMDD(this DateTime value)
    {
        return value.ToString("yyyy-MM-dd");
    }
}