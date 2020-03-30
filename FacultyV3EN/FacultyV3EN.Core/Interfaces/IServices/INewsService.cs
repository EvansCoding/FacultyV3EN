using FacultyV3EN.Core.Models.Entities;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Interfaces.IServices
{
    public interface INewsService
    {
        IEnumerable<News> PageList(string account, string name, string state, int page, int pageSize);
        IEnumerable<News> PageListFE(int page, int pageSize);
        News GetNewsByID(string id);
        List<News> GetNewsByName(string name);
        List<News> GetNews(int amount);
    }
}
