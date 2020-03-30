using FacultyV3EN.Core.Constants;
using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Core.Utilities;
using FacultyV3EN.Web.Common;
using FacultyV3EN.Web.ViewModels;
using System;
using System.Linq;
using System.Web.Mvc;

namespace FacultyV3EN.Web.Areas.Admin.Controllers
{
    public class ProfileController : BaseController
    {
        private readonly IAccountService accountService;

        public ProfileController(IAccountService accountService, IDataContext context) : base(context)
        {
            this.accountService = accountService;
        }

        public ActionResult ProfileView()
        {

            try
            {
                var session = (UserLogin)Session[Constant.USER_SESSION];
                var data = accountService.GetAccountByID(session.UserID.ToString());
                var model = new LoginViewModel();
                model.Id = data.Id.ToString();
                model.FullName = data.FullName;
                model.Email = data.Email;
                model.Password = "";
                model.Create_At = data.Create_At;
                model.Update_At = data.Update_At;
                model.Url_Image = data.Url_Image;
                model.Role = data.Role.Name;
                return View("ProfileView", model);
            }
            catch (System.Exception)
            {
            }
            return RedirectToAction("Logon", "Login", new { Area = "Admin" });
        }


        [HttpPost]
        public ActionResult AddOrUpdate(LoginViewModel model)
        {

            var meta_name = context.Accounts.Where(x => x.Email.Contains(model.Email)).ToList();

            if (model.Id != null)
            {
                try
                {
                    var account = accountService.GetAccountByID(model.Id);

                    account.FullName = model.FullName;

                    if (model.Password != null)
                    {
                        var passwordHash = Hash.Instance.ComputeSha256Hash(model.Password);
                        if (!account.Password.Equals(passwordHash) && model.Password.Length >= 6)
                            account.Password = passwordHash;
                        else
                        {
                            TempData[Constant.MessageViewBagName] = new GenericMessageViewModel
                            {
                                Message = "Update Failed",
                                MessageType = GenericMessages.error
                            };
                            return RedirectToAction("ProfileView", "Profile");
                        }
                    }

                    account.Update_At = DateTime.Now;

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

                return RedirectToAction("ProfileView", "Profile");
            }

            return RedirectToAction("Logon", "Login", new { Area = "Admin" });
        }
    }
}