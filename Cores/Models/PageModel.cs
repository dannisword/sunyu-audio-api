
namespace Sunyu.Audio.Cores.Models;

public class PageModel
{
     public decimal TotalCount { get; set; }

     public decimal TotalPage { get; set; }

     public PageModel(decimal totalCount, decimal totalPage)
     {
          this.TotalCount = totalCount;
          this.TotalPage = totalPage;
     }
}