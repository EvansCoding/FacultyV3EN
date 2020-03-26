using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Core.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;

namespace FacultyV3EN.Core.Services
{
    public class CategoryService : ICategoryService
    {
        private IDataContext context;
        public CategoryService(IDataContext context)
        {
            this.context = context;
        }

        public Category GetCategoryByID(string id)
        {
            try
            {
                return context.Categories.Find(new Guid(id));
            }
            catch (Exception)
            {
            }
            return null;
        }

        public List<Category> GetCategories()
        {
            try
            {
                return context.Categories.OrderBy(x => x.Meta_Name).Select(x => x).ToList();
            }
            catch (Exception)
            {
            }
            return null;
        }
    }
}
