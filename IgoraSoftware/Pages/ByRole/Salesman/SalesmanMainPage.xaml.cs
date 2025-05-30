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

namespace IgoraSoftware.Pages.ByRole.Salesman
{
    public partial class SalesmanMainPage : Page
    {
        Users User;
        public SalesmanMainPage(Users User)
        {
            this.User = User;
            InitializeComponent();
        }

        private void CreateOrder_Click(object sender, RoutedEventArgs e)
        {
            MainPage.MainFrame.Navigate(new CreateOrder());
        }
    }
}
