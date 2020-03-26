namespace FacultyV3EN.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initialize_3 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Account", "Url_Image", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Account", "Url_Image");
        }
    }
}
