using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Utilities;
using System;

namespace FacultyV3EN.Core.Models.Entities
{
    public class Banner : IBaseEntity
    {
        public Banner()
        {
            Id = GuidComb.GenerateComb();
        }

        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Url_Image { get; set; }
        public int Serial { get; set; }
    }
}
