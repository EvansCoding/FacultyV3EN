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
    public class PostService : IPostService
    {
        private IDataContext context;
        public PostService(IDataContext context)
        {
            this.context = context;
        }

        #region  Area Admin
        public IEnumerable<Post> PageList(string account, string name, string category, string state, int page, int pageSize)
        {
            try
            {
                if (string.IsNullOrEmpty(name) && string.IsNullOrEmpty(state) && string.IsNullOrEmpty(category))
                {
                    return context.Posts.Include(x => x.Category).Include(x => x.Account).Where(x => x.Account.Id == new Guid(account)).OrderByDescending(x => x.Update_At).ToPagedList(page, pageSize);
                }

                if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(state) && !string.IsNullOrEmpty(category))
                {
                    bool status = state == Status.PUBLISH.ToString() ? true : false;
                    try
                    {
                        Guid CategoryID = new Guid(category);

                        return context.Posts.Include(x => x.Category).Include(x => x.Account).Where(x => x.Title.Contains(name) && x.Category.Id == CategoryID && x.Status == status && x.Account.Id == new Guid(account)).OrderByDescending(x => x.Update_At).ToPagedList(page, pageSize);
                    }
                    catch (Exception)
                    {
                    }
                }

                if (!string.IsNullOrEmpty(name) || !string.IsNullOrEmpty(state) || !string.IsNullOrEmpty(category))
                {
                    var posts = context.Posts.Include(x => x.Category).Include(x => x.Account).Where(x => x.Account.Id == new Guid(account)).OrderByDescending(x => x.Update_At).ToList();

                    if (!string.IsNullOrEmpty(name))
                        posts = posts.Where(x => x.Title.Contains(name)).ToList();
                    if (!string.IsNullOrEmpty(state))
                    {
                        bool status = state == Status.PUBLISH.ToString() ? true : false;
                        posts = posts.Where(x => x.Status == status).ToList();
                    }
                    if (!string.IsNullOrEmpty(category))
                    {
                        try
                        {
                            Guid CategoryID = new Guid(category);
                            posts = posts.Where(x => x.Category.Id == CategoryID).ToList();
                        }
                        catch (Exception)
                        {
                        }
                    }
                    return posts.ToPagedList(page, pageSize);
                }

                return context.Posts.Include(x => x.Category).Include(x => x.Account).Where(x => x.Account.Id == new Guid(account)).OrderByDescending(x => x.Update_At).ToPagedList(page, pageSize);
            }
            catch (Exception)
            {
            }
            return null;
        }


        public IEnumerable<Post> PageListFE(string category, int page, int pageSize)
        {
            return context.Posts
                .Include(x => x.Account)
                .Include(x => x.Category)
                .Where(x => x.Category.Meta_Name.Equals(category) && x.Status).OrderByDescending(x => new { x.Update_At, x.Serial }).ToPagedList(page, pageSize);
        }


        public Post GetPostByID(string id)
        {
            try
            {
                Guid ID = new Guid(id);
                return context.Posts.Include(x => x.Account).Include(x => x.Category).Where(x => x.Id == ID).SingleOrDefault();

            }
            catch (Exception)
            {
            }
            return null;
        }

        public Post GetPostByName(string name)
        {
            return context.Posts.Where(x => x.Title == name && x.Status)
                           .Include(x => x.Category)
                           .Include(x => x.Account)
                           .SingleOrDefault();
        }

        public List<Post> GetPostsByName(string name)
        {
            return context.Posts.Where(x => x.Title == name && x.Status)
                           .OrderByDescending(x => x.Update_At)
                           .Include(x => x.Category)
                           .Include(x => x.Account)
                           .ToList();
        }

        public List<Post> GetPostsByCategory(string category)
        {
            try
            {
                return context.Posts
                    .Include(x => x.Account)
                    .Include(x => x.Category)
                    .Where(x => x.Category.Meta_Name.Equals(category)&& x.Status).ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<Post> GetPostsByCategory(string category, int amount)
        {
            try
            {
                return context.Posts
                    .Include(x => x.Account)
                    .Include(x => x.Category)
                    .Where(x => x.Category.Meta_Name.Equals(category) && x.Status).OrderByDescending(x => x.Update_At).OrderByDescending(x => x.Serial).Take(amount).ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }
        #endregion
    }
}
