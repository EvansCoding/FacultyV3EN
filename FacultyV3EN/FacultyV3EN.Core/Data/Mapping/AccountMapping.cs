using FacultyV3EN.Core.Models.Entities;
using System.Data.Entity.ModelConfiguration;

namespace FacultyV3EN.Core.Data.Mapping
{
    public class AccountMapping : EntityTypeConfiguration<Account>
    {
        public AccountMapping()
        {
            HasKey(x => x.Id);
            Property(x => x.Id).IsRequired();
            Property(x => x.Email).IsRequired().HasMaxLength(200);
            Property(x => x.Password).IsRequired().HasMaxLength(1024);
            Property(x => x.FullName).IsRequired().HasMaxLength(200);
            Property(x => x.Create_At).IsOptional();
            Property(x => x.Update_At).IsOptional();
            Property(x => x.Url_Image).IsOptional();

            HasMany(x => x.Events)
                .WithRequired(x => x.Account)
                .Map(x => x.MapKey("Account_ID"))
                .WillCascadeOnDelete(false);

            HasMany(x => x.News)
                .WithRequired(x => x.Account)
                .Map(x => x.MapKey("Account_ID"))
                .WillCascadeOnDelete(false);
        }
    }
}
