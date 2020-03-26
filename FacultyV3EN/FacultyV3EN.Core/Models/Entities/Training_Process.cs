using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Utilities;
using System;

namespace FacultyV3EN.Core.Models.Entities
{
    public class Training_Process : IBaseEntity
    {
        public Training_Process()
        {
            Id = GuidComb.GenerateComb();
        }

        public Guid Id { get; set; }
        public string Degree { get; set; }
        public string Graduation_Year { get; set; }
        public string Graduation_School { get; set; }
        public string Graduation_Specialized { get; set; }

        public virtual Lecturer Lecturer { get; set; }
    }
}
