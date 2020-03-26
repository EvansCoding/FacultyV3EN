namespace FacultyV3EN.Core.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Initialize : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Account",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Email = c.String(nullable: false, maxLength: 200),
                        Password = c.String(nullable: false, maxLength: 1024),
                        FullName = c.String(nullable: false, maxLength: 200),
                        Create_At = c.DateTime(),
                        Update_At = c.DateTime(),
                        Role_ID = c.Guid(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Role", t => t.Role_ID)
                .Index(t => t.Role_ID);
            
            CreateTable(
                "dbo.Post",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Title = c.String(nullable: false, maxLength: 1024),
                        Description = c.String(nullable: false, maxLength: 1024),
                        Content = c.String(nullable: false),
                        Serial = c.Int(nullable: false),
                        Status = c.Boolean(nullable: false),
                        Url_Image = c.String(maxLength: 300),
                        Url_Video = c.String(maxLength: 300),
                        Url_LinkGoogle = c.String(),
                        Create_At = c.DateTime(nullable: false),
                        Update_At = c.DateTime(nullable: false),
                        Category_ID = c.Guid(nullable: false),
                        Account_ID = c.Guid(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Category", t => t.Category_ID)
                .ForeignKey("dbo.Account", t => t.Account_ID)
                .Index(t => t.Category_ID)
                .Index(t => t.Account_ID);
            
            CreateTable(
                "dbo.Category",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Meta_Name = c.String(nullable: false),
                        Meta_Value = c.String(nullable: false),
                        Serial = c.Int(nullable: false),
                        Parent_ID = c.Guid(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Category", t => t.Parent_ID)
                .Index(t => t.Parent_ID);
            
            CreateTable(
                "dbo.Role",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Name = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Banner",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Title = c.String(nullable: false),
                        Url_Image = c.String(nullable: false),
                        Serial = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Confirguration",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Meta_Name = c.String(nullable: false),
                        Meta_Value = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Contact",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Meta_Name = c.String(nullable: false),
                        Meta_Value = c.String(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Lecturer",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        FullName = c.String(nullable: false, maxLength: 100),
                        Degree = c.String(nullable: false, maxLength: 100),
                        Url_Image = c.String(nullable: false, maxLength: 200),
                        Url_Facebook = c.String(nullable: false, maxLength: 200),
                        Phone = c.String(nullable: false, maxLength: 12),
                        Email = c.String(nullable: false, maxLength: 100),
                        Serial = c.Int(nullable: false),
                        Position = c.String(),
                        Academic_Rank = c.String(),
                        Specialized = c.String(),
                        Title = c.String(),
                        Native_Land = c.String(),
                        Url_Scientific_Works = c.String(),
                        Specialized_Research = c.String(),
                        Teaching = c.String(),
                        Create_At = c.DateTime(nullable: false),
                        Update_At = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Training_Process",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Degree = c.String(),
                        Graduation_Year = c.String(),
                        Graduation_School = c.String(),
                        Graduation_Specialized = c.String(),
                        Lecturer_ID = c.Guid(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Lecturer", t => t.Lecturer_ID, cascadeDelete: true)
                .Index(t => t.Lecturer_ID);
            
            CreateTable(
                "dbo.Sticky",
                c => new
                    {
                        Id = c.Guid(nullable: false),
                        Meta_Name = c.String(nullable: false, maxLength: 100),
                        Meta_Value = c.String(nullable: false, maxLength: 300),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Training_Process", "Lecturer_ID", "dbo.Lecturer");
            DropForeignKey("dbo.Account", "Role_ID", "dbo.Role");
            DropForeignKey("dbo.Post", "Account_ID", "dbo.Account");
            DropForeignKey("dbo.Post", "Category_ID", "dbo.Category");
            DropForeignKey("dbo.Category", "Parent_ID", "dbo.Category");
            DropIndex("dbo.Training_Process", new[] { "Lecturer_ID" });
            DropIndex("dbo.Category", new[] { "Parent_ID" });
            DropIndex("dbo.Post", new[] { "Account_ID" });
            DropIndex("dbo.Post", new[] { "Category_ID" });
            DropIndex("dbo.Account", new[] { "Role_ID" });
            DropTable("dbo.Sticky");
            DropTable("dbo.Training_Process");
            DropTable("dbo.Lecturer");
            DropTable("dbo.Contact");
            DropTable("dbo.Confirguration");
            DropTable("dbo.Banner");
            DropTable("dbo.Role");
            DropTable("dbo.Category");
            DropTable("dbo.Post");
            DropTable("dbo.Account");
        }
    }
}
