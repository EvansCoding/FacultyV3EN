namespace FacultyV3EN.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initialize_4 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Post", "DateOfEvents", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Post", "DateOfEvents");
        }
    }
}
