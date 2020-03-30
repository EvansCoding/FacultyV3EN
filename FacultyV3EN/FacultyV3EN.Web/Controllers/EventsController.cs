using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Controllers
{
    public class EventsController : Controller
    {
        private readonly IEventsService eventsService;
        private IDataContext context;
        public EventsController(IEventsService eventsService, IDataContext context)
        {
            this.context = context;
            this.eventsService = eventsService;
        }

        public ActionResult EventsDetailView(string id)
        {
            var model = eventsService.GetEventsByID(id);

            return View(model);
        }

        // Show list Post
        public ActionResult EventsView(int page = 1, int pageSize = 2)
        {
            var model = eventsService.PageListFE(page, pageSize);
            return View("EventsView", model);
        }

        public ActionResult _sidebar()
        {
            try
            {
                var model = context.Events.Include(x => x.Account).Where(x => x.Status).OrderByDescending(x => x.DateOfEvents).Take(3).ToList();
                if (model.Count > 0)
                    return PartialView(model);
            }
            catch (System.Exception)
            {
            }

            return PartialView(null);
        }
    }
}