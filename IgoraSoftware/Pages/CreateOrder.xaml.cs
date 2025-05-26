using IgoraSoftware.Database;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;


namespace IgoraSoftware.Pages
{
    public partial class CreateOrder : Page
    {
        List<ItemDataGrid> itemsDatas = new List<ItemDataGrid>();
        public CreateOrder()
        {
            InitializeComponent();
            foreach (Services service in App.entities.Services.ToList())
            {
                itemsDatas.Add(new ItemDataGrid(false, service.Name, service.PricePerHour));
            }
            ComboBox_CodeEnter.ItemsSource = App.entities.Clients.ToList();
            DataGrid_ListServices.ItemsSource = itemsDatas;
        }
        private void Button_Click(object sender, System.Windows.RoutedEventArgs e)
        {

        }
        private void CheckBox_Click(object sender, RoutedEventArgs e)
        {
            var checkbox = (CheckBox)sender;
            var item = (ItemDataGrid)checkbox.DataContext;
            item.IsChecked = checkbox.IsChecked;
        }
        class ItemDataGrid
        {
            public ItemDataGrid(bool IsChecked, string NameService, decimal PricePerHourService)
            {
                this.IsChecked = IsChecked;
                this.NameService = NameService;
                this.PricePerHourService = PricePerHourService;
            }
            public bool? IsChecked { get; set; }
            public string NameService { get; }
            public decimal PricePerHourService { get; }
        }
        
    }
}
