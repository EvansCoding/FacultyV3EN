using FacultyV3EN.Core.Models.Entities;
using System.Data.Entity.ModelConfiguration;

namespace FacultyV3EN.Core.Data.Mapping
{
    public class ConfirgurationMapping : EntityTypeConfiguration<Confirguration>
    {
        public ConfirgurationMapping()
        {
            HasKey(x => x.Id);
            Property(x => x.Id).IsRequired();
            Property(x => x.Meta_Name).IsRequired();
            Property(x => x.Meta_Value).IsRequired();
        }
    }
}
