using IgoraSoftware.Database;
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

namespace IgoraSoftware.Pages
{
    /// <summary>
    /// Логика взаимодействия для CreateServicePage.xaml
    /// </summary>
    public partial class CreateServicePage : Page
    {
        CreateOrder createOrder;
        public CreateServicePage(CreateOrder createOrder)
        {
            this.createOrder = createOrder;
            InitializeComponent();
        }
        private void Back_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            MainPage.TitleMain.Text = "Создание заказа";
            MainWindow.WindowFrame.GoBack();
        }
        private void Button_CreteService_Click(object sender, RoutedEventArgs e)
        {
            Services service = new Services()
            {
                Id = Convert.ToInt32(TextBox_IDServieEnter.Text),
                Name = TextBox_NameServiceEnter.Text,
                Code = TextBox_CodeServiceEnter.Text,
                PricePerHour = Convert.ToDecimal(TextBox_PricePerHourServiceEnter.Text)
            };

            App.entities.Services.Add(service);
            App.entities.SaveChanges();

            CreateOrder.ServicesList.ItemsSource = App.entities.Services.ToList();
            MainPage.TitleMain.Text = "Создание заказа";
            MainWindow.WindowFrame.GoBack();
            createOrder.RefreshListServices();
        }
    }
}
