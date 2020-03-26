namespace FacultyV3EN.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initalize_1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Lecturer", "Code", c => c.String(maxLength: 100));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Lecturer", "Code");
        }
    }
}
