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
        private readonly INewsService newsService;
        private readonly IEventsService eventsService;
        private readonly IConfirgurationService confirgurationService;
        private IDataContext context;
        public HomeController(IContactService contactService, IStickyService stickyService, IBannerService bannerService, INewsService newsService, IEventsService eventsService, IConfirgurationService confirgurationService,IDataContext context)
        {
            this.contactService = contactService;
            this.stickyService = stickyService;
            this.bannerService = bannerService;
            this.newsService = newsService;
            this.eventsService = eventsService;
            this.confirgurationService = confirgurationService;
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
            var phone = contactService.GetContactByID("E0D4420B-22E2-47D0-B835-E77A010F8EDD");

            ViewBag.Phone = phone;
            var language = stickyService.GetStickyByID("1a0ecb96-ff94-4523-a9c6-8bddababcbe0");

            ViewBag.Language = language;

            return PartialView();
        }

        public ActionResult _footer()
        {
            var model = contactService.GetContacts();
            return PartialView(model);
        }

        public ActionResult _sticky()
        {
            var total = confirgurationService.GetConfirgurationByName(Constant.TOTAL_ACCESS);
            ViewBag.Total = total.Meta_Value;
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
            var model = newsService.GetNews(3);
            return PartialView(model);
        }

        public ActionResult Events()
        {
            var model = eventsService.GetEvents( 3);
            return PartialView(model);
        }


    }
}