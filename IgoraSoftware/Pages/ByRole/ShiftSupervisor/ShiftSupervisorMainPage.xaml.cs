using IgoraSoftware.Database;

using System.Windows;
using System.Windows.Controls;


namespace IgoraSoftware.Pages.ByRole.ShiftSupervisor
{
    /// <summary>
    /// Логика взаимодействия для ShiftSupervisorMainPage.xaml
    /// </summary>
    public partial class ShiftSupervisorMainPage : Page
    {
        Users User;
        public ShiftSupervisorMainPage(Users User)
        {
            this.User = User;
            InitializeComponent();
        }

        private void CreateOrder_Click(object sender, RoutedEventArgs e)
        {
            MainPage.MainFrame.Navigate(new CreateOrder());
        }
        private void ExitUser_Click(object sender, RoutedEventArgs e)
        {
            MainPage.timerSession.Stop();
            MainWindow.WindowFrame.GoBack();
        }

        private void AcceptEqupments_Click(object sender, RoutedEventArgs e)
        {
            MainPage.TitleMain.Text = "Принятие оборудования заказа";
            MainPage.MainFrame.Navigate(new AcceptOrderEquipment());
        }
    }
}
