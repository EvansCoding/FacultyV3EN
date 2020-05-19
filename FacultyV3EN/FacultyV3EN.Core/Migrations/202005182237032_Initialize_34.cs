namespace FacultyV3EN.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initialize_34 : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.Events", "Block");
            DropColumn("dbo.News", "Block");
        }
        
        public override void Down()
        {
            AddColumn("dbo.News", "Block", c => c.Boolean());
            AddColumn("dbo.Events", "Block", c => c.Boolean());
        }
    }
}
