namespace FacultyV3EN.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initialize_2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Post", "Place", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Post", "Place");
        }
    }
}
