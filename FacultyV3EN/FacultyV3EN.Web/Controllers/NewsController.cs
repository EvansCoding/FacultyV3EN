using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using System.Web.Mvc;
using System.Data.Entity;
using System.Linq;

namespace FacultyV3EN.Web.Controllers
{
    public class NewsController : Controller
    {
        private readonly INewsService newsService;
        private IDataContext context;
        public NewsController(INewsService newsService, IDataContext context)
        {
            this.context = context;
            this.newsService = newsService;
        }

        public ActionResult NewsDetailView(string id)
        {
            var model = newsService.GetNewsByID(id);

            return View(model);
        }

        // Show list Post
        public ActionResult NewsView(int page = 1, int pageSize = 2)
        {
            var model = newsService.PageListFE(page, pageSize);
            return View("NewsView", model);
        }

        public ActionResult _sidebar()
        {
            try
            {
                var model = context.News.Include(x => x.Account).Where(x => x.Status).OrderByDescending(x => x.Update_At).Take(3).ToList();
                if(model.Count > 0)
                return PartialView(model);
            }
            catch (System.Exception)
            {
            }

            return PartialView(null);
        }
    }
}