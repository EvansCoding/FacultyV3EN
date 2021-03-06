﻿using FacultyV3EN.Core.Models.Entities;
using System.Collections.Generic;

namespace FacultyV3EN.Core.Interfaces.IServices
{
    public interface IAccountService
    {
        Account GetAccountByID(string id);
        Account GetAccountByEmail(string email);
        IEnumerable<Account> PageList(string name, int page, int pageSize);
        List<Account> GetAccounts();
        Account GetEmail(string email);
        bool ValidateUser(string email, string password);
    }
}
