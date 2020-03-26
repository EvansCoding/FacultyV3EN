using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Core.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;

namespace FacultyV3EN.Core.Services
{
    public class GraduationService : IGraduationService
    {
        private IDataContext context;

        public GraduationService(IDataContext context)
        {
            this.context = context;
        }

        public List<Training_Process> GetGraduations(string id)
        {
            try
            {
                return context.Training_Processes.Include(x => x.Lecturer).Where(x => x.Lecturer.Id == new Guid(id)).ToList();
            }
            catch (Exception)
            {

            }
            return null;
        }

        public Training_Process GetGraduationByID(string id)
        {
            try
            {
                Guid ID = new Guid(id);
                return context.Training_Processes.Include(x => x.Lecturer).Where(x => x.Id == ID).SingleOrDefault();
            }
            catch (Exception)
            {
            }
            return null;
        }
    }
}
