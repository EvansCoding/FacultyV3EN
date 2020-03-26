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
    public class BannerService : IBannerService
    {
        private IDataContext context;

        public BannerService(IDataContext context)
        {
            this.context = context;
        }

        public List<Banner> GetBanners()
        {
            try
            {
                return context.Banners
                    .Select(x => x).ToList();
            }
            catch (Exception)
            {

            }
            return null;
        }

        public Banner GetBannerByID(string id)
        {
            try
            {
                Guid ID = new Guid(id);
                return context.Banners.Find(ID);
            }
            catch (Exception)
            {
            }
            return null;
        }
    }
}
