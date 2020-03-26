using FacultyV3EN.Core.Models.Entities;
using System.Data.Entity.ModelConfiguration;

namespace FacultyV3EN.Core.Data.Mapping
{
    public class Training_ProcessMapping : EntityTypeConfiguration<Training_Process>
    {
        public Training_ProcessMapping()
        {
            HasKey(x => x.Id);
            Property(x => x.Id).IsRequired();
            Property(x => x.Degree).IsOptional();
            Property(x => x.Graduation_Year).IsOptional();
            Property(x => x.Graduation_School).IsOptional();
            Property(x => x.Graduation_Specialized).IsOptional();
        }
    }
}
