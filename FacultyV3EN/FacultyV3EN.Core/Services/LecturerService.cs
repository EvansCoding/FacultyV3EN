﻿using FacultyV3EN.Core.Interfaces;
using FacultyV3EN.Core.Interfaces.IServices;
using FacultyV3EN.Core.Models.Entities;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace FacultyV3EN.Core.Services
{
    public class LecturerService : ILecturerService
    {
        private IDataContext context;

        public LecturerService(IDataContext context)
        {
            this.context = context;
        }

        public IEnumerable<Lecturer> PageList(string name, int page, int pageSize)
        {
            if (!string.IsNullOrEmpty(name))
            {
                return context.Lecturers.Where(x => x.FullName.Contains(name)).OrderByDescending(x => new { x.Serial, x.Update_At }).ToPagedList(page, pageSize);
            }
            return context.Lecturers.OrderByDescending(x => new { x.Serial, x.Update_At }).ToPagedList(page, pageSize);
        }

        public Lecturer GetLecturerByID(string id)
        {
            try
            {
                Guid ID = new Guid(id);
                return context.Lecturers.Where(x => x.Id == ID).Include(x => x.Training_Processes).SingleOrDefault();
            }
            catch (Exception)
            {
            }
            return null;
        }

        public Lecturer GetLecturerByCode(string code)
        {
            try
            {
                return context.Lecturers.Where(x => x.Code == code).Include(x => x.Training_Processes).SingleOrDefault();
            }
            catch (Exception)
            {
            }
            return null;
        }

        public List<Lecturer> GetStudentOrderBySerial(int amount)
        {
            try
            {
                var rand = new Random();
                return context.Lecturers.OrderBy(x => Guid.NewGuid()).Take(amount).OrderBy(x => x.Serial).ToList();
            }
            catch (Exception)
            {
            }
            return null;
        }
    }
}