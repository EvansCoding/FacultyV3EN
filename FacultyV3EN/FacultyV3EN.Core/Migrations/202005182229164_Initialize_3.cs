namespace FacultyV3EN.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initialize_3 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Account", "Block", c => c.Boolean());
            AddColumn("dbo.Events", "Block", c => c.Boolean());
            AddColumn("dbo.News", "Block", c => c.Boolean());
        }
        
        public override void Down()
        {
            DropColumn("dbo.News", "Block");
            DropColumn("dbo.Events", "Block");
            DropColumn("dbo.Account", "Block");
        }
    }
}
