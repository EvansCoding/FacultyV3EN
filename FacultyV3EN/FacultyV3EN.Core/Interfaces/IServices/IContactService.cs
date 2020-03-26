using FacultyV3EN.Core.Models.Entities;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Interfaces.IServices
{
    public interface IContactService
    {
        Contact GetContactByID(string Id);
        List<Contact> GetContacts();
    }
}
