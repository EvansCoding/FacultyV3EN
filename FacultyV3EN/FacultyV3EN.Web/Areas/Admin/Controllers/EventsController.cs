using FacultyV3EN.Core.Constants;
using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Core.Models.Entities;
using FacultyV3EN.Core.Models.Enums;
using FacultyV3EN.Web.Common;
using FacultyV3EN.Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Areas.Admin.Controllers
{
    public class EventsController : BaseController
    {
        private readonly IEventsService eventsService;

        public EventsController(IEventsService eventsService,  IDataContext context) : base(context)
        {
            this.eventsService = eventsService;
        }

        public ActionResult EventsView()
        {
            return View();
        }

        [HttpGet]
        public ActionResult LoadTable(string search, string state, int page = 1, int pageSize = 8)
        {
            var session = (UserLogin)Session[Constant.USER_SESSION];
            var model = eventsService.PageList(session.UserID.ToString(), search, state, page, pageSize);
            return PartialView("EventsTablePartialView", model);
        }

        public ActionResult AddOrEdit(string Id = "")
        {
            try
            {
                var data = eventsService.GetEventsByID(Id);
                if (data != null)
                {
                    var model = new PostViewModel();
                    model.Title = data.Title;
                    model.Description = data.Description;
                    model.Content = data.Content;
                    model.Serial = data.Serial;
                    model.Place = data.Place;
                    model.DateOfEvents = data.DateOfEvents;
                    model.Status = data.Status ? Gender.PUBLISH.ToString() : Gender.UNPUBLISH.ToString();
                    model.Url_Image = data.Url_Image;
                    model.Url_Video = data.Url_Video;
                    model.Url_LinkGoogle = data.Url_LinkGoogle;
                    return PartialView("CRUDEvents", model);
                }
            }
            catch (Exception)
            {
            }
            return PartialView("CRUDEvents", new PostViewModel());
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult AddOrUpdate(PostViewModel model)
        {
            var session = (UserLogin)Session[Constant.USER_SESSION];
            if (session == null)
                return RedirectToAction("Logon", "Login", new { Area = "Admin" });
            if (model.Id == null)
            {
                try
                {
                    Events events = new Events()
                    {
                        Title = model.Title,
                        Description = model.Description,
                        Content = model.Content,
                        Serial = model.Serial,
                        Place = model.Place,
                        DateOfEvents = model.DateOfEvents != null ? model.DateOfEvents : null,
                        Status = model.Status.Equals(Gender.PUBLISH.ToString()) ? true : false,
                        Url_Image = model.Url_Image == null ? "#" : model.Url_Image,
                        Url_Video = model.Url_Video == null ? "#" : model.Url_Video,
                        Url_LinkGoogle = model.Url_LinkGoogle == null ? "#" : model.Url_LinkGoogle,
                        Create_At = DateTime.Now,
                        Update_At = DateTime.Now,
                        Account = context.Accounts.Find(session.UserID)
                    };

                    context.Events.Add(events);
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
                        Message = "Insert Failed",
                        MessageType = GenericMessages.error
                    };
                }
            }
            else
            {
                try
                {
                    var events = eventsService.GetEventsByID(model.Id);
                    events.Title = model.Title;
                    events.Description = model.Description;
                    events.Content = model.Content;
                    events.Serial = model.Serial;
                    events.Place = model.Place;
                    events.DateOfEvents = model.DateOfEvents != null ? model.DateOfEvents : null;
                    events.Status = model.Status.Equals(Gender.PUBLISH.ToString()) ? true : false;
                    events.Url_Image = model.Url_Image == null ? "#" : model.Url_Image;
                    events.Url_Video = model.Url_Video == null ? "#" : model.Url_Video;
                    events.Url_LinkGoogle = model.Url_LinkGoogle == null ? "#" : model.Url_LinkGoogle;
                    events.Update_At = DateTime.Now;
                    events.Account = context.Accounts.Find(session.UserID);

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
            return RedirectToAction("EventsView", "Events");
        }

        [HttpPost]
        public ActionResult Delete(string Id)
        {
            try
            {
                var post = context.Events.Find(new Guid(Id));
                context.Events.Remove(post);
                context.SaveChanges();
                return Json(new { success = true }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
            }
            return Json(new { success = false }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Publish(string Id)
        {
            try
            {
                var post = eventsService.GetEventsByID(Id);
                if (post.Status)
                {
                    post.Status = false;
                    context.SaveChanges();
                    return Json(new { success = true, message = "Hide successful posts" }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    post.Status = true;
                    context.SaveChanges();
                    return Json(new
                    {
                        success = true,
                        message = "Publication of successful posts"
                    }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception)
            {

            }
            return Json(new { success = false, message = "An error has occurred" }, JsonRequestBehavior.AllowGet);
        }
    }
}