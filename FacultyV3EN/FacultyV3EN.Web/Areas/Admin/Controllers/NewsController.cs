using FacultyV3EN.Core.Constants;
using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Core.Models.Entities;
using FacultyV3EN.Core.Models.Enums;
using FacultyV3EN.Web.Common;
using FacultyV3EN.Web.ViewModels;
using System;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Areas.Admin.Controllers
{
    public class NewsController : BaseController
    {
        private readonly INewsService newsService;

        public NewsController(INewsService newsService, IDataContext context) : base(context)
        {
            this.newsService = newsService;
        }

        public ActionResult NewsView()
        {
            return View();
        }

        [HttpGet]
        public ActionResult LoadTable(string search, string state, int page = 1, int pageSize = 8)
        {
            var session = (UserLogin)Session[Constant.USER_SESSION];
            var model = newsService.PageList(session.UserID.ToString(), search, state, page, pageSize);
            return PartialView("NewsTablePartialView", model);
        }

        public ActionResult AddOrEdit(string Id = "")
        {
            try
            {
                var data = newsService.GetNewsByID(Id);
                if (data != null)
                {
                    var model = new PostViewModel();
                    model.Title = data.Title;
                    model.Description = data.Description;
                    model.Content = data.Content;
                    model.Serial = data.Serial;
                    model.Status = data.Status ? Gender.PUBLISH.ToString() : Gender.UNPUBLISH.ToString();
                    model.Url_Image = data.Url_Image;
                    model.Url_Video = data.Url_Video;
                    model.Url_LinkGoogle = data.Url_LinkGoogle;
                    return PartialView("CRUDNews", model);
                }
            }
            catch (Exception)
            {
            }
            return PartialView("CRUDNews", new PostViewModel());
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
                    News news = new News()
                    {
                        Title = model.Title,
                        Description = model.Description,
                        Content = model.Content,
                        Serial = model.Serial,
                        Status = model.Status.Equals(Gender.PUBLISH.ToString()) ? true : false,
                        Url_Image = model.Url_Image == null ? "#" : model.Url_Image,
                        Url_Video = model.Url_Video == null ? "#" : model.Url_Video,
                        Url_LinkGoogle = model.Url_LinkGoogle == null ? "#" : model.Url_LinkGoogle,
                        Create_At = DateTime.Now,
                        Update_At = DateTime.Now,
                        Account = context.Accounts.Find(session.UserID)
                    };

                    context.News.Add(news);
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
                    var news = newsService.GetNewsByID(model.Id);
                    news.Title = model.Title;
                    news.Description = model.Description;
                    news.Content = model.Content;
                    news.Serial = model.Serial;
                    news.Status = model.Status.Equals(Gender.PUBLISH.ToString()) ? true : false;
                    news.Url_Image = model.Url_Image == null ? "#" : model.Url_Image;
                    news.Url_Video = model.Url_Video == null ? "#" : model.Url_Video;
                    news.Url_LinkGoogle = model.Url_LinkGoogle == null ? "#" : model.Url_LinkGoogle;
                    news.Update_At = DateTime.Now;
                    news.Account = context.Accounts.Find(session.UserID);

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
            return RedirectToAction("NewsView", "News");
        }

        [HttpPost]
        public ActionResult Delete(string Id)
        {
            try
            {
                var post = context.News.Find(new Guid(Id));
                context.News.Remove(post);
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
                var post = newsService.GetNewsByID(Id);
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