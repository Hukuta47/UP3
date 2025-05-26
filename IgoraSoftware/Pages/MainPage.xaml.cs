using IgoraSoftware.Database;
using IgoraSoftware.Pages.ByRole.Administrator;
using IgoraSoftware.Pages.ByRole.Salesman;
using IgoraSoftware.Pages.ByRole.ShiftSupervisor;
using System.Windows.Controls;

namespace IgoraSoftware.Pages
{
    public partial class MainPage : Page
    {
        PageHelper pageHelper;
        public MainPage(Users User)
        {
            InitializeComponent();
            pageHelper.Frame = Frame_UserPages;

            switch (User.RoleId)
            {
                case 1: pageHelper.Frame.Navigate(new AdministratorMainPage(User)); break;
                case 2: pageHelper.Frame.Navigate(new ShiftSupervisorMainPage(User)); break;
                case 3: pageHelper.Frame.Navigate(new SalesmanMainPage(User)); break;
            }
        }
    }
}
