using System.Linq;
using System.Windows.Controls;

namespace IgoraSoftware.Pages.ByRole.ShiftSupervisor
{
    public partial class AcceptOrderEquipment : Page
    {
        public AcceptOrderEquipment()
        {
            InitializeComponent();
            ComboBox_SelectOrder.ItemsSource = App.entities.Order.ToList();
        }
    }
}
