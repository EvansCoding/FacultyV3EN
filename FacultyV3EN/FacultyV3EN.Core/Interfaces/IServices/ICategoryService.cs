using FacultyV3EN.Core.Models.Entities;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Interfaces.IServices
{
    public interface ICategoryService
    {
        Category GetCategoryByID(string id);
        List<Category> GetCategories();
    }
}
