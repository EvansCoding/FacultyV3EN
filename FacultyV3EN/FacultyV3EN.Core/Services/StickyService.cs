using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Core.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FacultyV3EN.Core.Services
{
    public class StickyService : IStickyService
    {
        private IDataContext context;
        public StickyService(IDataContext context)
        {
            this.context = context;
        }

        public Sticky GetStickyByID(string id)
        {
            try
            {
                return context.Stickies.Where(x => x.Id == new Guid(id)).SingleOrDefault();
            }
            catch (Exception)
            {
            }
            return null;
        }

        public List<Sticky> GetStickys()
        {
            try
            {
                return context.Stickies.OrderBy(x => x.Meta_Name).ToList();
            }
            catch (Exception)
            {
            }
            return null;
        }
    }
}
