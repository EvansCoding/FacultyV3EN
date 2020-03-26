using FacultyV3EN.Core.Constants;
using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Core.Models.Entities;
using FacultyV3EN.Web.Common;
using FacultyV3EN.Web.ViewModels;
using System;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Areas.Admin.Controllers
{
    public class BannerController : BaseController
    {
        private readonly IBannerService bannerService;

        public BannerController(IBannerService bannerService, IDataContext context) : base(context)
        {
            this.bannerService = bannerService;
        }

        [HasCredential(RoleID = Constant.ADMIN)]
        public ActionResult BannerView()
        {
            return View();
        }

        [HttpGet]
        public ActionResult LoadTable()
        {
            var model = bannerService.GetBanners();
            return PartialView("BannerTablePartialView", model);
        }

        public ActionResult AddOrEdit(string Id = "")
        {
            try
            {
                var data = bannerService.GetBannerByID(Id);
                if (data != null)
                {
                    var model = new BannerViewModel();
                    model.Title = data.Title;
                    model.Url_Image = data.Url_Image;
                    model.Serial = data.Serial;
                    return PartialView("CRUDBanner", model);
                }
            }
            catch (Exception)
            {
            }
            return PartialView("CRUDBanner", new BannerViewModel());
        }

        [HttpPost]
        public ActionResult AddOrUpdate(BannerViewModel model)
        {
            if (model.Id == null)
            {
                Banner banner = new Banner()
                {
                    Title = model.Title,
                    Url_Image = model.Url_Image,
                    Serial = model.Serial,
                };

                try
                {
                    context.Banners.Add(banner);
                    context.SaveChanges();
                    TempData[Constant.MessageViewBagName] = new GenericMessageViewModel
                    {
                        Message = "Insert Successfull",
                        MessageType = GenericMessages.success
                    };
                }
                catch (Exception)
                {
                    TempData[Constant.MessageViewBagName] = new GenericMessageViewModel
                    {
                        Message = "Update Failed",
                        MessageType = GenericMessages.error
                    };
                }
            }
            else
            {
                try
                {
                    var banner = bannerService.GetBannerByID(model.Id);
                    banner.Title = model.Title;
                    banner.Url_Image = model.Url_Image;
                    banner.Serial = model.Serial;
                    context.SaveChanges();
                    TempData[Constant.MessageViewBagName] = new GenericMessageViewModel
                    {
                        Message = "Update Successfull",
                        MessageType = GenericMessages.success
                    };
                }
                catch (Exception)
                {
                    TempData[Constant.MessageViewBagName] = new GenericMessageViewModel
                    {
                        Message = "Update Failed",
                        MessageType = GenericMessages.error
                    };
                }
            }
            return RedirectToAction("BannerView", "Banner");
        }

        [HttpPost]
        public ActionResult Delete(string Id)
        {
            try
            {
                var banner = context.Banners.Find(new Guid(Id));
                context.Banners.Remove(banner);
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