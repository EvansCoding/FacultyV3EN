﻿using System.Web.Mvc;

namespace FacultyV3EN.Web.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { controller = "Login", action = "LoginView", id = UrlParameter.Optional },
                namespaces: new[] { "FacultyV3EN.Web.Areas.Admin.Controllers" }
            );
        }
    }
}