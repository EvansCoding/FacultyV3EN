using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Utilities;
using System;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Models.Entities
{
    public class Account : IBaseEntity
    {
        public Account()
        {
            Id = GuidComb.GenerateComb();
        }

        public Guid Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FullName { get; set; }
        public string Url_Image { get; set; }
        public DateTime Create_At { get; set; }
        public DateTime Update_At { get; set; }

        public virtual Role Role { get; set; }
        public virtual IList<Post> Posts { get; set; }
    }
}
