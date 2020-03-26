using FacultyV3EN.Core.Models.Entities;

namespace FacultyV3EN.Core.Interfaces.IServices
{
    public interface IRoleService
    {
        Role GetRoleByID(string id);
    }
}
