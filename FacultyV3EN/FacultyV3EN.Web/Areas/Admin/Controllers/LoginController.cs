using FacultyV3EN.Core.Constants;
using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Web.Common;
using FacultyV3EN.Web.ViewModels;
using System.Web.Mvc;
using System.Web.Security;

namespace FacultyV3EN.Web.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        private IDataContext context;
        private readonly IAccountService accountService;

        public LoginController(IAccountService accountService, IDataContext context)
        {
            this.context = context;
            this.accountService = accountService;
        }

        public ActionResult LoginView()
        {
            return View();
        }

        public ActionResult LogOn(LoginViewModel model)
        {
            var email = model.Email;
            var passwork = model.Password;
            if (ModelState.IsValid)
            {
                if (accountService.ValidateUser(email, passwork))
                {
                    FormsAuthentication.SetAuthCookie(email, true);
                    var user = accountService.GetEmail(email);
                    var userSession = new UserLogin();
                    userSession.Email = user.Email;
                    userSession.UserID = user.Id;
                    var creadential = user.Role.Name;
                    Session.Add(Constant.USER_SESSION, userSession);
                    // Set role
                    Session.Add(Constant.SESSION_CREDENTIAL, creadential);
                    return RedirectToAction("ProfileView", "Profile", new { Area = "Admin" });
                }
            }
            ModelState.AddModelError(string.Empty, "The account or password is incorrect!");
            return View("LoginView");
        }

        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            return RedirectToAction("LoginView", "Login", new { Area = "Admin" });
        }
    }
}