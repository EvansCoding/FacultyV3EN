﻿using FacultyV3EN.Core.Constants;
using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Web.Common;
using FacultyV3EN.Web.ViewModels;
using System;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Areas.Admin.Controllers
{
    public class StickyController : BaseController
    {
        private readonly IStickyService stickyService;

        public StickyController(IStickyService stickyService, IDataContext context) : base(context)
        {
            this.stickyService = stickyService;
        }

        [HasCredential(RoleID = Constant.ADMIN)]
        public ActionResult StickyView()
        {
            return View();
        }

        [HttpGet]
        public ActionResult LoadTable()
        {
            var model = stickyService.GetStickys();
            return PartialView("StickyTablePartialView", model);
        }

        public ActionResult AddOrEdit(string Id = "")
        {
            try
            {
                var data = stickyService.GetStickyByID(Id);
                if (data != null)
                {
                    var model = new StickyViewModel();
                    model.Meta_Name = data.Meta_Name;
                    model.Meta_Value = data.Meta_Value;
                    return PartialView("CRUDSticky", model);
                }
            }
            catch (Exception)
            {
            }
            return PartialView("CRUDSticky", new StickyViewModel());
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AddOrUpdate(StickyViewModel model)
        {
            try
            {
                var stickey = stickyService.GetStickyByID(model.Id);
                stickey.Meta_Value = model.Meta_Value;
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