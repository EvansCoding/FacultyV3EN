﻿namespace FacultyV3EN.Core.Migrations
{
    using FacultyV3EN.Core.Data.Context;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    public class Configuration : DbMigrationsConfiguration<FacultyV3EN.Core.Data.Context.DataContext>
    {
        private readonly bool _pendingMigrations;
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            var migrator = new DbMigrator(this);

            _pendingMigrations = migrator.GetPendingMigrations().Any();

            if (_pendingMigrations)
            {
                migrator.Update();
                Seed(new DataContext());
            }
        }

        protected override void Seed(FacultyV3EN.Core.Data.Context.DataContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method
            //  to avoid creating duplicate seed data.
        }
    }
}
