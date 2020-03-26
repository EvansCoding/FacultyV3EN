using FacultyV3EN.Core.Constants;
using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Controllers
{
    public class PostController : Controller
    {
        private readonly IPostService postService;
        private IDataContext context;
        public PostController(IPostService postService, IDataContext context)
        {
            this.context = context;
            this.postService = postService;
        }

        public ActionResult PostDetailView(string id)
        {
            var model = postService.GetPostByID(id);

            return View(model);
        }

        // Show list Post
        public ActionResult PostNewsView(int page = 1, int pageSize = 2)
        {
            var model = postService.PageListFE(Constant.CATEGORY_NEWS, page, pageSize);
            return View("PostView", model);
        }

        public ActionResult PostEventsView(int page = 1, int pageSize = 2)
        {
            var model = postService.PageListFE(Constant.CATEGORY_EVENTS, page, pageSize);
            return View("PostView", model);
        }
    }
}