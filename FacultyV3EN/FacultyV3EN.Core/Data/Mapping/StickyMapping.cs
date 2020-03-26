using FacultyV3EN.Core.Models.Entities;
using System.Data.Entity.ModelConfiguration;

namespace FacultyV3EN.Core.Data.Mapping
{
    public class StickyMapping : EntityTypeConfiguration<Sticky>
    {
        public StickyMapping()
        {
            HasKey(x => x.Id);
            Property(x => x.Id).IsRequired();
            Property(x => x.Meta_Name).IsRequired().HasMaxLength(100);
            Property(x => x.Meta_Value).IsRequired().HasMaxLength(300);
        }
    }
}
