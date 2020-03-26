using FacultyV3EN.Core.Constants;
using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Web.Common;
using FacultyV3EN.Web.ViewModels;
using System;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Areas.Admin.Controllers
{
    public class ContactController : BaseController
    {
        private readonly IContactService contactService;

        public ContactController(IContactService contactService, IDataContext context) : base(context)
        {
            this.contactService = contactService;
        }

        [HasCredential(RoleID = Constant.ADMIN)]
        public ActionResult ContactView()
        {
            return View();
        }

        [HttpGet]
        public ActionResult LoadTable(string search, int page = 1, int pageSize = 10)
        {
            var model = contactService.GetContacts();

            return PartialView("ContactTablePartialView", model);
        }

        public ActionResult AddOrEdit(string Id = "")
        {
            try
            {
                var data = contactService.GetContactByID(Id);
                if (data != null)
                {
                    var model = new ContactViewModel();
                    model.Meta_Name = data.Meta_Name;
                    model.Meta_Value = data.Meta_Value;
                    return PartialView("CRUDContact", model);
                }
            }
            catch (Exception)
            {
            }
            return PartialView("CRUDContact", new ContactViewModel());
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AddOrUpdate(ContactViewModel model)
        {
            try
            {
                var contact = contactService.GetContactByID(model.Id);
                contact.Meta_Value = model.Meta_Value;

                context.SaveChanges();

                return Json(new { success = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
            }
            return Json(new { success = false }, JsonRequestBehavior.AllowGet);
        }
    }
}