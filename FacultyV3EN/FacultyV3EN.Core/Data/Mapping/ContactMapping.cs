using FacultyV3EN.Core.Models.Entities;
using System.Data.Entity.ModelConfiguration;

namespace FacultyV3EN.Core.Data.Mapping
{
    public class ContactMapping : EntityTypeConfiguration<Contact>
    {
        public ContactMapping()
        {
            HasKey(x => x.Id);
            Property(x => x.Id).IsRequired();
            Property(x => x.Meta_Name).IsRequired();
            Property(x => x.Meta_Value).IsRequired();
        }
    }
}
