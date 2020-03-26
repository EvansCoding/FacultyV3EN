namespace FacultyV3EN.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initialize_5 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Post", "DateOfEvents", c => c.DateTime());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Post", "DateOfEvents", c => c.String());
        }
    }
}
