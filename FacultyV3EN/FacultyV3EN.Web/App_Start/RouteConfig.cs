using System.Web.Mvc;
using System.Web.Routing;

namespace FacultyV3EN.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Contact",
                url: "contact/{id}",
                defaults: new { controller = "Contact", action = "ContactView", id = UrlParameter.Optional },
                namespaces: new[] { "FacultyV3EN.Web.Controllers" }
            );

            routes.MapRoute(
                name: "ABOUTUS",
                url: "about-us/{id}",
                defaults: new { controller = "AboutUs", action = "AboutUsView", id = UrlParameter.Optional },
                namespaces: new[] { "FacultyV3EN.Web.Controllers" }
            );

            routes.MapRoute(
                name: "NEWS",
                url: "news/{id}",
                defaults: new { controller = "News", action = "NewsView", id = UrlParameter.Optional },
                namespaces: new[] { "FacultyV3EN.Web.Controllers" }
            );

            routes.MapRoute(
                name: "EVENTS",
                url: "events/{id}",
                defaults: new { controller = "Events", action = "EventsView", id = UrlParameter.Optional },
                namespaces: new[] { "FacultyV3EN.Web.Controllers" }
            );

            routes.MapRoute(
                name: "DETAILNEWS",
                url: "news/{title}/{id}",
                defaults: new { controller = "News", action = "NewsDetailView", title = UrlParameter.Optional, id = UrlParameter.Optional },
                namespaces: new[] { "FacultyV3EN.Web.Controllers" }
            );
            routes.MapRoute(
                name: "DETAILEVENTS",
                url: "events/{title}/{id}",
                defaults: new { controller = "Events", action = "EventsDetailView", title = UrlParameter.Optional, id = UrlParameter.Optional },
                namespaces: new[] { "FacultyV3EN.Web.Controllers" }
            );
            routes.MapRoute(
                name: "TEACHERS",
                url: "teachers/{id}",
                defaults: new { controller = "Teacher", action = "TeacherView", id = UrlParameter.Optional },
                namespaces: new[] { "FacultyV3EN.Web.Controllers" }
            );

            routes.MapRoute(
                name: "DETAILTEACHER",
                url: "teachers/{name}/{code}",
                defaults: new { controller = "Teacher", action = "TeacherDetailView", name = UrlParameter.Optional, code = UrlParameter.Optional },
                namespaces: new[] { "FacultyV3EN.Web.Controllers" }
            );
            
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "FacultyV3EN.Web.Controllers" }
            );
        }
    }
}
