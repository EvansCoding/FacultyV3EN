using FacultyV3EN.Core.Constants;
using FacultyV3EN.Core.Interfaces;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Common
{
    public class BaseController : Controller
    {
        protected readonly IDataContext context;

        public BaseController(IDataContext context)
        {
            this.context = context;
        }

        protected override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            var session = (UserLogin)Session[Constant.USER_SESSION];
            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new { controller = "Login", action = "Logon", Area = "Admin" }));
            }
            base.OnActionExecuted(filterContext);
        }
    }
}