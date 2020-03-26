using FacultyV3EN.Core.Models.Entities;
using System.Data.Entity.ModelConfiguration;

namespace FacultyV3EN.Core.Data.Mapping
{
    public class BannerMapping : EntityTypeConfiguration<Banner>
    {
        public BannerMapping()
        {
            HasKey(x => x.Id);
            Property(x => x.Title).IsRequired();
            Property(x => x.Url_Image).IsRequired();
            Property(x => x.Serial).IsRequired();
        }
    }
}
