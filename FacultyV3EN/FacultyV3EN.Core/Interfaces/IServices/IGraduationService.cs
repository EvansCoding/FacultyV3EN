using FacultyV3EN.Core.Models.Entities;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Interfaces.IServices
{
    public interface IGraduationService
    {
        List<Training_Process> GetGraduations(string id);
        Training_Process GetGraduationByID(string id);
    }
}
