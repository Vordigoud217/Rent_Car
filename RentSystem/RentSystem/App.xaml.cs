using RentSystem.DBModel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity.Core.Objects.DataClasses;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace RentSystem
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static CarRentSystemEntities Db = new CarRentSystemEntities();
        public static decimal TotalPrice;
        public static Users LogedUser;
    }
}
        