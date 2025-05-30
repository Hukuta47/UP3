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

namespace IgoraSoftware.Pages.ByRole.Administrator
{
    /// <summary>
    /// Логика взаимодействия для ResultOrdersLstPage.xaml
    /// </summary>
    public partial class ResultOrdersLstPage : Page
    {
        public ResultOrdersLstPage()
        {
            InitializeComponent();
            DataGrid_ListOpenOrders.ItemsSource = App.entities.Order.ToList();
        }
        private void Back_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            MainPage.TitleMain.Text = "Главная страница";
            MainWindow.WindowFrame.GoBack();
        }
    }
}
