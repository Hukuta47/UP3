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
                itemsDatas.Add(new ItemDataGrid(service.Name, service.PricePerHour));
            }
            ComboBox_CodeOrderEnter.ItemsSource = App.entities.Orders_Log.ToList();
            ComboBox_CodeOrderEnter.Text = (App.entities.Order.ToList().Last().Id + 1).ToString();
            ComboBox_CodeClientEnter.ItemsSource = App.entities.Clients.ToList();
            DataGrid_ListServices.ItemsSource = itemsDatas;
        }
        private void CheckBox_Click(object sender, RoutedEventArgs e)
        {
            var checkbox = (CheckBox)sender;
            var item = (ItemDataGrid)checkbox.DataContext;
            item.IsChecked = checkbox.IsChecked;
        }
        class ItemDataGrid
        {
            public ItemDataGrid(string NameService, decimal PricePerHourService)
            {
                this.NameService = NameService;
                this.PricePerHourService = PricePerHourService;
            }
            public bool? IsChecked { get; set; } = false;
            public string NameService { get; }
            public decimal PricePerHourService { get; }
        }
        
    }
}
