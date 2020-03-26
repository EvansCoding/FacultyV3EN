using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Utilities;
using System;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Models.Entities
{
    public class Category : IBaseEntity
    {
        public Category()
        {
            Id = GuidComb.GenerateComb();
        }

        public Guid Id { get; set; }
        public string Meta_Name { get; set; }
        public string Meta_Value { get; set; }
        public int Serial { get; set; }

        public virtual Category Parent { get; set; }
        public virtual IList<Category> Children { get; set; }
        public virtual IList<Post> Posts { get; set; }
    }
}
