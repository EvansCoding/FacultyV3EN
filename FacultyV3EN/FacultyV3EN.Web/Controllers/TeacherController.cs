using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using System;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Controllers
{
    public class TeacherController : Controller
    {
        private readonly ILecturerService lecturerService;
        private IDataContext context;

        public TeacherController(ILecturerService lecturerService, IDataContext context)
        {
            this.context = context;
            this.lecturerService = lecturerService;
        }

        public ActionResult TeacherDetailView(string code)
        {
            var model = lecturerService.GetLecturerByCode(code.Replace("-", "."));
            return View(model);
        }

        public ActionResult TeacherView()
        {
            return View();
        }

        public ActionResult _sidebar()
        {
            var model = lecturerService.GetStudentOrderBySerial(6);
            return PartialView(model);
        }

        public ActionResult LoadTable(string search, int page = 1, int pageSize = 8)
        {
            try
            {
                var model = lecturerService.PageList(search, page, pageSize);
                if (model != null)
                    return PartialView("TeacherTablePartialView", model);
            }
            catch (Exception)
            {
            }
            return View("~/Views/Shared/Error.cshtml");
        }
    }
}