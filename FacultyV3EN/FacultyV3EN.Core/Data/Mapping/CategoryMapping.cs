using FacultyV3EN.Core.Models.Entities;
using System.Data.Entity.ModelConfiguration;

namespace FacultyV3EN.Core.Data.Mapping
{
    public class CategoryMapping : EntityTypeConfiguration<Category>
    {
        public CategoryMapping()
        {
            HasKey(x => x.Id);
            Property(x => x.Id).IsRequired();
            Property(x => x.Meta_Name).IsRequired();
            Property(x => x.Meta_Value).IsRequired();
            Property(x => x.Serial).IsRequired();

            HasMany(x => x.Posts)
                .WithRequired(x => x.Category)
                .Map(x => x.MapKey("Category_ID"))
                .WillCascadeOnDelete(false);

            HasOptional(x => x.Parent)
                .WithMany(x => x.Children)
                .Map(x => x.MapKey("Parent_ID"))
                .WillCascadeOnDelete(false);
        }
    }
}
