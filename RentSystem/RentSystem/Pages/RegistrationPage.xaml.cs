using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using RentSystem.DBModel;

namespace RentSystem.Pages
{
    /// <summary>
    /// Логика взаимодействия для RegistrationPage.xaml
    /// </summary>
    public partial class RegistrationPage : Page
    {
        public RegistrationPage()
        {
            InitializeComponent();
        }

        private void BBack_Click(object sender, RoutedEventArgs e)
        {
            var loginUgari = App.Db.Users.FirstOrDefault(x => x.Login == TBLogin.Text);
            var passwordUgari = App.Db.Users.FirstOrDefault(x => x.Password == TBPassword.Password);
            NavigationService.GoBack();
        }

        private void BRegistrationPage_Click(object sender, RoutedEventArgs e)
        {
            var users = new Users();

            if (string.IsNullOrWhiteSpace(TBFIO.Text) == true)
            {
                MessageBox.Show("Ошибка ФИО");
            }
            else if (string.IsNullOrWhiteSpace(TBPhoneNumber.Text) == true)
            {
                MessageBox.Show("Ошибка телефон");
            }
            else if (string.IsNullOrWhiteSpace(TBLogin.Text) == true)
            {
                MessageBox.Show("Ошибка Логин");
            }
            else if (string.IsNullOrWhiteSpace(TBPassword.Password) == true)
            {
                MessageBox.Show("Ошибка Пароль");
            }                
            else
            {
                users.FIO = TBFIO.Text;
                users.PhoneNumber = TBPhoneNumber.Text;
                users.Login = TBLogin.Text;
                users.Password = TBPassword.Password;
                users.RoleID = 1;

                App.Db.Users.Add(users);
                App.Db.SaveChanges();
                MessageBox.Show("Вы успешно зарегистрировались!");
                NavigationService.GoBack();
            }
        }
    }
}
