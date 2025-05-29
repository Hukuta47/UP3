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
using System.Windows.Shapes;

namespace IgoraSoftware
{
    public partial class CreateServiceDialog : Window
    {
        public CreateServiceDialog()
        {
            InitializeComponent();
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
        }
    }
}
