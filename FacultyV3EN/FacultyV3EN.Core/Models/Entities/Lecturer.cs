using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Utilities;
using System;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Models.Entities
{
    public class Lecturer : IBaseEntity
    {
        public Lecturer()
        {
            Id = GuidComb.GenerateComb();
        }

        public Guid Id { get; set; }
        public string FullName { get; set; }
        public string Code { get; set; }
        public string Degree { get; set; }
        public string Url_Image { get; set; }
        public string Url_Facebook { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public int Serial { get; set; }
        public string Position { get; set; }
        public string Academic_Rank { get; set; }
        public string Specialized { get; set; }
        public string Title { get; set; }
        public string Native_Land { get; set; }
        public string Url_Scientific_Works { get; set; }
        public string Specialized_Research { get; set; }
        public string Teaching { get; set; }
        public DateTime Create_At { get; set; }
        public DateTime Update_At { get; set; }

        public virtual IList<Training_Process> Training_Processes { get; set; }
    }
}
