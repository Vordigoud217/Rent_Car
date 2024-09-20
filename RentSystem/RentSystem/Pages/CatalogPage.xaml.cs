using Microsoft.Win32;
using RentSystem.DBModel;
using RentSystem;
using System;
using System.Collections.Generic;
using System.IO;
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
using System.Collections.ObjectModel;

namespace RentSystem.Pages
{
    /// <summary>
    /// Логика взаимодействия для CatalogPage.xaml
    /// </summary>
    public partial class CatalogPage : Page
    {
        public CatalogPage()
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
            LvCarMenu.ItemsSource = App.Db.Car_specifications.ToList();
            CbCarBrand.ItemsSource = brands;
            CbCarModel.ItemsSource = models;
            CbCarEngine.ItemsSource = engines;
            CbCarDriveUnit.ItemsSource = driveUnits;
            CbCarTransmission.ItemsSource = transmissions;
            RefreshCars();
        }

        private void BtResetOptions_Click(object sender, RoutedEventArgs e)
        {
            CbCarBrand.SelectedIndex = -1;
            CbCarModel.SelectedIndex = -1;
            CbCarEngine.SelectedIndex = -1;
            CbCarDriveUnit.SelectedIndex = -1;
            CbCarTransmission.SelectedIndex = -1;
        }

        private void CbCarBrand_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            RefreshCars();
        }
        private void CbCarModel_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            RefreshCars();
        }
        private void CbCarEngine_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            RefreshCars();
        }
        private void CbCarDriveUnit_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            RefreshCars();
        }
        private void CbCarTransmission_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            RefreshCars();
        }
        private void RefreshCars()
        {
            var a = App.Db.Car_specifications.ToList();
            var carModel = CbCarModel.SelectedItem;
            var carBrand = CbCarBrand.SelectedItem;
            var carEngine = CbCarEngine.SelectedItem;
            var carDriveUnit = CbCarDriveUnit.SelectedItem;
            var carTransmission = CbCarTransmission.SelectedItem;

            if (CbCarBrand.SelectedItem != null)
            {
                a = a.Where(x => x.Brands.BrandName == carBrand.ToString()).ToList();
            }
            if (CbCarModel.SelectedItem != null)
            {
                a = a.Where(x => x.Models.ModelName == carModel.ToString()).ToList();
            }
            if (CbCarEngine.SelectedItem != null)
            {
                a = a.Where(x => x.Engines.Engine == carEngine.ToString()).ToList();
            }
            if(CbCarDriveUnit.SelectedItem != null)
            {
                a = a.Where(x => x.DriveUnits.DriveUnit == carDriveUnit.ToString()).ToList();
            }
            if(CbCarTransmission.SelectedItem != null)
            {
                a = a.Where(x => x.Transmissions.Transmission == carTransmission.ToString()).ToList();
            }            
            LvCarMenu.ItemsSource = a;
        }

        private void BtImage_Click(object sender, RoutedEventArgs e)
        {
            var daun = (sender as Button).DataContext as Car_specifications;
            var imageCar = App.Db.Car_specifications.FirstOrDefault(x => x.Spec_ID == daun.Spec_ID);
            var ugari = new OpenFileDialog();
            if (ugari.ShowDialog().GetValueOrDefault())
            {
                imageCar.ImageCar = File.ReadAllBytes(ugari.FileName);
                App.Db.SaveChanges();
                LvCarMenu.ItemsSource = App.Db.Car_specifications.ToList();
            }
        }

        private void PCatalogPage_Loaded(object sender, RoutedEventArgs e)
        {
            LvCarMenu.Items.Refresh();
        }

        private void BtAddCar_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddCarPage());
        }

        private void BtDelete_Click(object sender, RoutedEventArgs e)
        {
            var car = (sender as Button).DataContext as Car_specifications;
            App.Db.Car_specifications.Remove(car);
            App.Db.SaveChanges();
            MessageBox.Show("Машина удалена");
            LvCarMenu.ItemsSource = App.Db.Car_specifications.ToList();
        }
    }
}
