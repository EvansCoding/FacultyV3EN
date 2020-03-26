using FacultyV3EN.Core.Constants;
using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly IContactService contactService;
        private readonly IStickyService stickyService;
        private readonly IBannerService bannerService;
        private readonly IPostService postService;
        private IDataContext context;
        public HomeController(IContactService contactService, IStickyService stickyService, IBannerService bannerService, IPostService postService, IDataContext context)
        {
            this.contactService = contactService;
            this.stickyService = stickyService;
            this.bannerService = bannerService;
            this.postService = postService;
            this.context = context;
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult _banner()
        {
            var model = bannerService.GetBanners();
            return PartialView(model);
        }

        public ActionResult _header()
        {
            var model = contactService.GetContactByID("E0D4420B-22E2-47D0-B835-E77A010F8EDD");
            return PartialView(model);
        }

        public ActionResult _footer()
        {
            var model = contactService.GetContacts();
            return PartialView(model);
        }

        public ActionResult _sticky()
        {
            var model = stickyService.GetStickys();
            return PartialView(model);
        }

        public ActionResult _menu()
        {
            var model = stickyService.GetStickys();
            return PartialView(model);
        }

        public ActionResult News()
        {
            var model = postService.GetPostsByCategory(Constant.CATEGORY_NEWS, 3);
            return PartialView(model);
        }

        public ActionResult Events()
        {
            var model = postService.GetPostsByCategory(Constant.CATEGORY_EVENTS, 3);
            return PartialView(model);
        }

        public ActionResult _sidebar()
        {
            var model = context.Posts.Include(x => x.Account).Include(x => x.Category).OrderByDescending(x => x.Update_At).Take(3).ToList();
            return PartialView(model);
        }
    }
}