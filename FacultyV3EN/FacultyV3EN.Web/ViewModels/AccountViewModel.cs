﻿using System;

namespace FacultyV3EN.Web.ViewModels
{
    public class AccountViewModel
    {
        public string Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FullName { get; set; }
        public string Url_Image { get; set; }
        public string RoleID { get; set; }
        public DateTime Create_At { get; set; }
        public DateTime Update_At { get; set; }
    }
}