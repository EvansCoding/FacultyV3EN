using FacultyV3EN.Core.Constants;
using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Core.Models.Entities;
using FacultyV3EN.Core.Models.Enums;
using FacultyV3EN.Web.Common;
using FacultyV3EN.Web.ViewModels;
using System;
using System.Collections.Generic;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Areas.Admin.Controllers
{
    public class PostController : BaseController
    {
        private readonly IPostService postService;
        private readonly ICategoryService categoryService;

        public PostController(IPostService postService, ICategoryService categoryService, IDataContext context) : base(context)
        {
            this.postService = postService;
            this.categoryService = categoryService;
        }

        public ActionResult PostView()
        {
            List<Category> ListCategory = categoryService.GetCategories();
            if (ListCategory != null)
                ViewBag.ListOfCategory = new SelectList(ListCategory, "Id", "Meta_Name");
            return View();
        }

        [HttpGet]
        public ActionResult LoadTable(string search, string category, string state, int page = 1, int pageSize = 8)
        {
            var session = (UserLogin)Session[Constant.USER_SESSION];
            var model = postService.PageList(session.UserID.ToString(), search, category, state, page, pageSize);
            return PartialView("PostTablePartialView", model);
        }

        public ActionResult AddOrEdit(string Id = "")
        {
            List<Category> ListCategory = categoryService.GetCategories();

            try
            {
                var data = postService.GetPostByID(Id);
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
                    ViewBag.ListOfCategory = new SelectList(ListCategory, "Id", "Meta_Name", data.Category.Id);
                    return PartialView("CRUDPost", model);
                }
            }
            catch (Exception)
            {
            }
            ViewBag.ListOfCategory = new SelectList(ListCategory, "Id", "Meta_Name");
            return PartialView("CRUDPost", new PostViewModel());
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
                    Post post = new Post()
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
                        Category = context.Categories.Find(new Guid(model.CategoryID)),
                        Create_At = DateTime.Now,
                        Update_At = DateTime.Now,
                        Account = context.Accounts.Find(session.UserID)
                    };

                    context.Posts.Add(post);
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
                    var post = postService.GetPostByID(model.Id);
                    post.Title = model.Title;
                    post.Description = model.Description;
                    post.Content = model.Content;
                    post.Serial = model.Serial;
                    post.Place = model.Place;
                    post.DateOfEvents = model.DateOfEvents != null ? model.DateOfEvents : null;
                    post.Status = model.Status.Equals(Gender.PUBLISH.ToString()) ? true : false;
                    post.Url_Image = model.Url_Image == null ? "#" : model.Url_Image;
                    post.Url_Video = model.Url_Video == null ? "#" : model.Url_Video;
                    post.Url_LinkGoogle = model.Url_LinkGoogle == null ? "#" : model.Url_LinkGoogle;
                    post.Update_At = DateTime.Now;
                    post.Category = context.Categories.Find(new Guid(model.CategoryID));
                    post.Account = context.Accounts.Find(session.UserID);

                    //var data = utf8Convert3(detail_Menu.Title.ToLower()).Replace(" ", "-");
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
            return RedirectToAction("PostView", "Post");
        }

        [HttpPost]
        public ActionResult Delete(string Id)
        {
            try
            {
                var post = context.Posts.Find(new Guid(Id));
                context.Posts.Remove(post);
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
                var post = postService.GetPostByID(Id);
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
                    return Json(new { success = true, message = "Publication of successful posts"
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