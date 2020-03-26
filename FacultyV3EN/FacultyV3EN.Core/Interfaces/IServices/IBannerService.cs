using FacultyV3EN.Core.Models.Entities;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Interfaces.IServices
{
    public interface IBannerService
    {
        Banner GetBannerByID(string id);
        List<Banner> GetBanners();
    }
}
