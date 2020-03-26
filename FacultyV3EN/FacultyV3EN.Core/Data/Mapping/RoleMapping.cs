using FacultyV3EN.Core.Models.Entities;
using System.Data.Entity.ModelConfiguration;

namespace FacultyV3EN.Core.Data.Mapping
{
    public class RoleMapping : EntityTypeConfiguration<Role>
    {
        public RoleMapping()
        {
            HasKey(x => x.Id);
            Property(x => x.Id).IsRequired();
            Property(x => x.Name).IsRequired();

            HasMany(x => x.Accounts)
                .WithOptional(x => x.Role)
                .Map(x => x.MapKey("Role_ID"))
                .WillCascadeOnDelete(false);
        }
    }
}
