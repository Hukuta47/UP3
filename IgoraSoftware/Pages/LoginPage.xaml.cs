using IgoraSoftware.Database;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using IgoraSoftware.Pages.ByRole.Administrator;
using IgoraSoftware.Pages.ByRole.ShiftSupervisor;
using IgoraSoftware.Pages.ByRole.Salesman;

namespace IgoraSoftware.Pages
{
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string Login = TextBox_LoginEnter.Text;
            string Password = PasswordBox_PasswordEnter.Password;

            if (App.entities.Users.ToList().Exists(user => user.Login == Login))
            {
                Users User = App.entities.Users.First(user => user.Login == Login);

                if (Password == User.Password)
                {
                    App.LoginedUser = User;

                }
                else
                {
                    MessageBox.Show("Не Заебись");
                }
            }
            else
            {
                MessageBox.Show("Такого нет(");
            }
        }
    }
}
