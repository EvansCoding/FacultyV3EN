﻿using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Utilities;
using System;

namespace FacultyV3EN.Core.Models.Entities
{
    public class News : IBaseEntity
    {
        public News()
        {
            Id = GuidComb.GenerateComb();
        }

        public Guid Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string Content { get; set; }
        public int Serial { get; set; }
        public bool Status { get; set; }
        public string Url_Image { get; set; }
        public string Url_Video { get; set; }
        public string Url_LinkGoogle { get; set; }
        public DateTime Create_At { get; set; }
        public DateTime Update_At { get; set; } 
        public virtual Account Account { get; set; }
    }
}
