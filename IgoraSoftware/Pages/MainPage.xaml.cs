using IgoraSoftware.Database;
using IgoraSoftware.Pages.ByRole.Administrator;
using IgoraSoftware.Pages.ByRole.Salesman;
using IgoraSoftware.Pages.ByRole.ShiftSupervisor;
using System.Windows.Controls;

namespace IgoraSoftware.Pages
{
    public partial class MainPage : Page
    {
        public static Frame MainFrame;
        public MainPage(Users User)
        {
            InitializeComponent();
            MainFrame = Frame_UserPages;
            switch (User.RoleId)
            {
                case 1: MainFrame.Navigate(new AdministratorMainPage(User)); break;
                case 2: MainFrame.Navigate(new ShiftSupervisorMainPage(User)); break;
                case 3: MainFrame.Navigate(new SalesmanMainPage(User)); break;
            }
        }
    }
}
