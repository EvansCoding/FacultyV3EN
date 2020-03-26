using FacultyV3EN.Core.Models.Entities;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Interfaces.IServices
{
    public interface IPostService
    {
        IEnumerable<Post> PageList(string account, string name, string category, string state, int page, int pageSize);
        IEnumerable<Post> PageListFE(string category, int page, int pageSize);
        Post GetPostByID(string id);
        Post GetPostByName(string name);
        List<Post> GetPostsByName(string name);
        List<Post> GetPostsByCategory(string category);
        List<Post> GetPostsByCategory(string category, int amount);
    }
}
