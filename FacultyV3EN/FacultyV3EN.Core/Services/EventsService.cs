using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Core.Models.Entities;
using FacultyV3EN.Core.Models.Enums;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace FacultyV3EN.Core.Services
{
    public class EventsService : IEventsService
    {
        private IDataContext context;
        private readonly IAccountService accountService;
        public EventsService(IAccountService accountService,IDataContext context)
        {
            this.context = context;
            this.accountService = accountService;
        }

        #region General
        public Events GetEventsByID(string id)
        {
            try
            {
                Guid ID = new Guid(id);
                return context.Events
                    .Include(x => x.Account)
                    .Where(x => x.Id == ID)
                    .SingleOrDefault();
            }
            catch (Exception)
            {
            }
            return null;
        }
        #endregion

        #region  Area Admin
        public IEnumerable<Events> PageList(string account, string name, string state, int page, int pageSize)
        {
            try
            {
                var user = accountService.GetAccountByID(account);
                if (user.Role.Name.Equals(Constants.Constant.ADMIN))
                {
                    if (!string.IsNullOrEmpty(name) || !string.IsNullOrEmpty(state))
                    {
                        var posts = context.Events
                            .Include(x => x.Account)
                            .OrderByDescending(x => x.Update_At)
                            .ToList();

                        if (!string.IsNullOrEmpty(name))
                            posts = posts.Where(x => x.Title.Contains(name)).ToList();
                        if (!string.IsNullOrEmpty(state))
                        {
                            bool status = state == Status.PUBLISH.ToString() ? true : false;
                            posts = posts.Where(x => x.Status == status).ToList();
                        }
                        return posts.ToPagedList(page, pageSize);
                    }

                    return context.Events
                        .Include(x => x.Account)
                        .OrderByDescending(x => x.Update_At)
                        .ToPagedList(page, pageSize);
                }

                if (!string.IsNullOrEmpty(name) || !string.IsNullOrEmpty(state))
                {
                    var posts = context.Events
                        .Include(x => x.Account)
                        .Where(x => x.Account.Id == new Guid(account))
                        .OrderByDescending(x => x.Update_At)
                        .ToList();

                    if (!string.IsNullOrEmpty(name))
                        posts = posts.Where(x => x.Title.Contains(name)).ToList();
                    if (!string.IsNullOrEmpty(state))
                    {
                        bool status = state == Status.PUBLISH.ToString() ? true : false;
                        posts = posts.Where(x => x.Status == status).ToList();
                    }
                    return posts.ToPagedList(page, pageSize);
                }

                return context.Events
                    .Include(x => x.Account)
                    .Where(x => x.Account.Id == new Guid(account))
                    .OrderByDescending(x => x.Update_At)
                    .ToPagedList(page, pageSize);
            }
            catch (Exception)
            {
            }
            return null;
        }

        public List<Events> GetEventsByName(string name)
        {
            return context.Events
                .Where(x => x.Title == name && x.Status)
                .OrderByDescending(x => x.Update_At)
                .Include(x => x.Account)
                .ToList();
        }
        #endregion

        #region Area Client
        public IEnumerable<Events> PageListFE(int page, int pageSize)
        {
            var model = context.Events
                .Include(x => x.Account)
                .Where(x => x.Status)
                .OrderByDescending(x => x.DateOfEvents).ToList();

            var data = model.OrderByDescending(x => x.Serial);
            return data.ToPagedList(page, pageSize);
        }

        public List<Events> GetEvents(int amount)
        {
            try
            {
                var model = context.Events
                    .Include(x => x.Account)
                    .Where(x => x.Status)
                    .OrderByDescending(x => x.DateOfEvents).ToList();
                var data = model.OrderByDescending(x => x.Serial).Take(amount).ToList();

                return data;
            }
            catch (Exception)
            {
                return null;
            }
        }
        #endregion
    }
}
