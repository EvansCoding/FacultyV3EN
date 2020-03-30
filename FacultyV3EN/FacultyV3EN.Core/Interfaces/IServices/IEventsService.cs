using FacultyV3EN.Core.Models.Entities;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Interfaces.IServices
{
    public interface IEventsService
    {
        IEnumerable<Events> PageList(string account, string name, string state, int page, int pageSize);
        IEnumerable<Events> PageListFE(int page, int pageSize);
        Events GetEventsByID(string id);
        List<Events> GetEventsByName(string name);
        List<Events> GetEvents(int amount);
    }
}
