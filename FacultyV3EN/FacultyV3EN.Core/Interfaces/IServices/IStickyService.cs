using FacultyV3EN.Core.Models.Entities;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Interfaces.IServices
{
    public interface IStickyService
    {
        Sticky GetStickyByID(string id);
        List<Sticky> GetStickys();
    }
}
