using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Core.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;

namespace FacultyV3EN.Core.Services
{
    public class ConfirgurationService : IConfirgurationService
    {
        private IDataContext context;
        public ConfirgurationService(IDataContext context)
        {
            this.context = context;
        }

        public Confirguration GetConfirgurationByName(string name)
        {
            try
            {
                return context.Confirgurations.Where(x => x.Meta_Name == name && x.Meta_Value != null).SingleOrDefault();
            }
            catch (Exception)
            {
            }
            return null;
        }

        public Confirguration GetConfirgurationByID(string id)
        {
            try
            {
                return context.Confirgurations.Where(x => x.Id == new Guid(id)).SingleOrDefault();
            }
            catch (Exception)
            {
            }
            return null;
        }

        public List<Confirguration> GetConfirgurations()
        {
            try
            {
                return context.Confirgurations.OrderBy(x => x.Meta_Name).Select(x => x).ToList();
            }
            catch (Exception)
            {
            }
            return null;
        }
    }
}
