using FacultyV3EN.Core.Interfaces.IServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Controllers
{
    public class ContactController : Controller
    {
        private readonly IContactService contactService;
        public ContactController(IContactService contactService)
        {
            this.contactService = contactService;
        }
        public ActionResult ContactView()
        {
            var model = contactService.GetContacts();
            return View(model);
        }
    }
}