namespace FacultyV3EN.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initialize_4 : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Account", "Block", c => c.Boolean(nullable: false));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Account", "Block", c => c.Boolean());
        }
    }
}
