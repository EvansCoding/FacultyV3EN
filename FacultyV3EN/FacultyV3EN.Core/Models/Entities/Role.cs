using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Utilities;
using System;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Models.Entities
{
    public class Role : IBaseEntity
    {
        public Role()
        {
            Id = GuidComb.GenerateComb();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }

        public virtual IList<Account> Accounts { get; set; }
    }
}
