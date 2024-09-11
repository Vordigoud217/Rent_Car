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

namespace RentSystem.Pages
{
    /// <summary>
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void BRegistration_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new RegistrationPage());
        }

        private void BEnter_Click(object sender, RoutedEventArgs e)
        {
            var login = TBLogin.Text;
            var password = TBPassword.Password;
            var userLogin = App.Db.Users.FirstOrDefault(x => x.Login == login && x.Password == password);

            if (userLogin == null)
            {
                MessageBox.Show("Введите логин или пароль");
            }

            else
            {
                App.LogedUser = userLogin;
                NavigationService.Navigate(new MainPage());
            }
        }
    }
}
