using FacultyV3EN.Core.Models.Entities;
using System.Data.Entity.ModelConfiguration;

namespace FacultyV3EN.Core.Data.Mapping
{
    public class EventsMapping : EntityTypeConfiguration<Events>
    {
        public EventsMapping()
        {
            HasKey(x => x.Id);
            Property(x => x.Id).IsRequired();
            Property(x => x.Title).IsRequired().HasMaxLength(1024);
            Property(x => x.Description).IsRequired().HasMaxLength(1024);
            Property(x => x.Content).IsRequired();
            Property(x => x.Serial).IsRequired();
            Property(x => x.Status).IsRequired();
            Property(x => x.Url_Image).IsOptional().HasMaxLength(300);
            Property(x => x.Url_Video).IsOptional().HasMaxLength(300);
            Property(x => x.Url_LinkGoogle).IsOptional();
            Property(x => x.DateOfEvents).IsOptional();
            Property(x => x.Place).IsOptional();
            Property(x => x.Create_At).IsRequired();
            Property(x => x.Update_At).IsRequired();
        }
    }
}
