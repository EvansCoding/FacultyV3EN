using FacultyV3EN.Core.Models.Entities;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Interfaces.IServices
{
    public interface ILecturerService
    {
        Lecturer GetLecturerByID(string id);
        Lecturer GetLecturerByCode(string code);
        IEnumerable<Lecturer> PageList(string name, int page, int pageSize);
        List<Lecturer> GetStudentOrderBySerial(int amount);
    }
}
