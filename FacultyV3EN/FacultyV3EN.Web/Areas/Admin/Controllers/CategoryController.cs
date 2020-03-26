using FacultyV3EN.Core.Constants;
using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Web.Common;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Areas.Admin.Controllers
{
    public class CategoryController : BaseController
    {
        public readonly ICategoryService categoryService;

        public CategoryController(ICategoryService categoryService, IDataContext context) : base(context)
        {
            this.categoryService = categoryService;
        }

        [HasCredential(RoleID = Constant.ADMIN)]
        public ActionResult CategoryView()
        {
            return View();
        }

        [HttpGet]
        public ActionResult LoadTable()
        {
            var model = categoryService.GetCategories();
            return PartialView("CategoryTablePartialView", model);
        }

    }
}