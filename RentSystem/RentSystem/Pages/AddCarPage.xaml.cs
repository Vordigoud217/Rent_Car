using Microsoft.Win32;
using RentSystem.DBModel;
using RentSystem;
using System;
using System.IO;
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
    /// Логика взаимодействия для AddCarPage.xaml
    /// </summary>
    public partial class AddCarPage : Page
    {

        public AddCarPage()
        {
            InitializeComponent();
            TbPrice.Text = null;
        }

        private void BtAdd_Click(object sender, RoutedEventArgs e)
        {
            Car_specifications car = new Car_specifications();
            string model = null;
            string brands = null;
            string driveUnits = null;
            string engines = null;
            string transmissions = null;
            string price;

            if (CbBrand.SelectedItem != null)
            {
                brands = CbBrand.SelectedItem.ToString();
                car.Brand_ID = App.Db.Car_specifications.FirstOrDefault(x => x.Brands.BrandName == brands).Brand_ID;
            }
            else
            { 
                MessageBox.Show("Выберите бренд!");
                return;    
            }
            
            if (CbModel.SelectedItem != null)
            {
                model = CbModel.SelectedItem.ToString();
                car.Model_ID = App.Db.Car_specifications.FirstOrDefault(x => x.Models.ModelName == model).Model_ID;
            }
            else
            {
                MessageBox.Show("Выберите модель!");
                return;
            }
            
            if (CbDriveUnit.SelectedItem != null)
            {
                driveUnits = CbDriveUnit.SelectedItem.ToString();
                car.DriveUnit_ID = App.Db.Car_specifications.FirstOrDefault(x => x.DriveUnits.DriveUnit == driveUnits).DriveUnit_ID;
            }
            else
            {
                MessageBox.Show("Выберите привод!");
                return;
            }
            
            if (CbTransmission.SelectedItem != null)
            {
                transmissions = CbTransmission.SelectedItem.ToString();
                car.Transmission_ID = App.Db.Car_specifications.FirstOrDefault(x => x.Transmissions.Transmission == transmissions).Transmission_ID;
            }
            else
            {
                MessageBox.Show("Выберите коробку передач!");
                return;
            }
            
            if (CbEngine.SelectedItem != null)
            {
                engines = CbEngine.SelectedItem.ToString();
                car.Engine_ID = App.Db.Car_specifications.FirstOrDefault(x => x.Engines.Engine == engines).Engine_ID;
            }
            else
            {
                MessageBox.Show("Выберите двигатель!");
                return;
            }

            if (String.IsNullOrWhiteSpace(TbPrice.Text) == false)
            {
                price = TbPrice.Text;
            }
            else 
            {
                MessageBox.Show("Введите цену!");
                return;
            }

            car.Model_ID = App.Db.Models.FirstOrDefault(x => x.ModelName == model).Model_ID;
            car.Brand_ID = App.Db.Brands.FirstOrDefault(x => x.BrandName == brands).Brand_ID;
            car.DriveUnit_ID = App.Db.DriveUnits.FirstOrDefault(x => x.DriveUnit == driveUnits).DriveUnit_ID;
            car.Transmission_ID = App.Db.Transmissions.FirstOrDefault(x => x.Transmission == transmissions).Transmission_ID;
            car.Engine_ID = App.Db.Engines.FirstOrDefault(x => x.Engine == engines).Engine_ID;

            App.Db.Car_specifications.Add(car);
            App.Db.SaveChanges();

            Cars newCar = new Cars
            {
                Spec_ID = App.Db.Car_specifications.OrderByDescending(x => x.Spec_ID).Select(x => x.Spec_ID).FirstOrDefault(),
                Price = int.Parse(price),
                Car_Status_ID = 1
            };

            App.Db.Cars.Add(newCar);
            App.Db.SaveChanges();
            MessageBox.Show("Автомобиль успешно добавлен");
            NavigationService.GoBack();
        }

        private void BtClose_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            List<string> brands = new List<string>();
            foreach (var brand in App.Db.Brands)
            {
                brands.Add(brand.BrandName);
            }
            List<string> models = new List<string>();
            foreach (var model in App.Db.Models)
            {
                models.Add(model.ModelName);
            }
            List<string> engines = new List<string>();
            foreach (var engine in App.Db.Engines)
            {
                engines.Add(engine.Engine);
            }
            List<string> driveUnits = new List<string>();
            foreach (var driveUnit in App.Db.DriveUnits)
            {
                driveUnits.Add(driveUnit.DriveUnit);
            }
            List<string> transmissions = new List<string>();
            foreach (var transmission in App.Db.Transmissions)
            {
                transmissions.Add(transmission.Transmission);
            }

            InitializeComponent();
            CbBrand.ItemsSource = brands;
            CbModel.ItemsSource = models;
            CbEngine.ItemsSource = engines;
            CbDriveUnit.ItemsSource = driveUnits;
            CbTransmission.ItemsSource = transmissions;
        }

        private void BtUploadImage_Click(object sender, RoutedEventArgs e)
        {
            var imageCar = App.Db.Car_specifications.FirstOrDefault();
            var dialog = new OpenFileDialog();

            if (dialog.ShowDialog().GetValueOrDefault())
            {
                imageCar.ImageCar = File.ReadAllBytes(dialog.FileName);
                CarImage.Source = new BitmapImage(new Uri(dialog.FileName));
            }
        }
    }
}

