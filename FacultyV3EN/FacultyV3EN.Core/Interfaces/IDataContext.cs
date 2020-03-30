using FacultyV3EN.Core.Models.Entities;
using System.Data.Entity;

namespace FacultyV3EN.Core.Interfaces
{
    public interface IDataContext
    {
        DbSet<Account> Accounts { get; set; }
        DbSet<Banner> Banners { get; set; }
        DbSet<Confirguration> Confirgurations { get; set; }
        DbSet<Contact> Contacts { get; set; }
        DbSet<Lecturer> Lecturers { get; set; }
        DbSet<News> News { get; set; }
        DbSet<Events> Events { get; set; }
        DbSet<Role> Roles { get; set; }
        DbSet<Sticky> Stickies { get; set; }
        DbSet<Training_Process> Training_Processes { get; set; }

        int SaveChanges();
    }
}
