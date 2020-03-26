using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Core.Models.Entities;
using System;
using System.Linq;

namespace FacultyV3EN.Core.Services
{
    public class RoleService : IRoleService
    {
        private IDataContext context;
        public RoleService(IDataContext context)
        {
            this.context = context;
        }


        public Role GetRoleByID(string id)
        {
            try
            {
                return context.Roles.Where(x => x.Id == new Guid(id)).SingleOrDefault();
            }
            catch (Exception)
            {
            }
            return null;
        }

    }
}
