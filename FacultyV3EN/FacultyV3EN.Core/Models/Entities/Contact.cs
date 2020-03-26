using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Utilities;
using System;

namespace FacultyV3EN.Core.Models.Entities
{
    public class Contact : IBaseEntity
    {
        public Contact()
        {
            Id = GuidComb.GenerateComb();
        }

        public Guid Id { get; set; }
        public string Meta_Name { get; set; }
        public string Meta_Value { get; set; }
    }
}
