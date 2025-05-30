using IgoraSoftware.Database;
using IgoraSoftware.Pages.ByRole.Administrator;
using IgoraSoftware.Pages.ByRole.Salesman;
using IgoraSoftware.Pages.ByRole.ShiftSupervisor;
using System;
using System.Windows.Threading;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows;

namespace IgoraSoftware.Pages
{
    public partial class MainPage : Page
    {
        public static Frame MainFrame;
        public static TextBlock TitleMain;

        Users User;
        static public DispatcherTimer timerSession = new DispatcherTimer(DispatcherPriority.Render) { Interval = TimeSpan.FromSeconds(1) };
        TimeSpan timeSession = new TimeSpan(2, 30, 0);
        TimeSpan timeToEndSession = TimeSpan.FromMinutes(15);
        //TimeSpan timeSession = new TimeSpan(0, 0, 5);
        //TimeSpan timeToEndSession = TimeSpan.FromMinutes(1);
        public MainPage(Users User)
        {
            this.User = User;
            timerSession.Tick += TimerSession_Tick;

            InitializeComponent();

            TitleMain = TextBlock_TitleWelcomeText;

            TextBlock_TitleWelcomeText.Text = $"Добро пожаловать {User.Name}!";
            if (User.RoleId != 1) TextBlock_TimeSession.Text = "Оставшеевся время сеанса: " + timeSession.ToString();
            if (User.RoleId != 1) timerSession.Start();
            MainFrame = Frame_UserPages;
            switch (User.RoleId)
            {
                case 1: MainFrame.Navigate(new AdministratorMainPage(User)); break;
                case 2: MainFrame.Navigate(new ShiftSupervisorMainPage(User)); break;
                case 3: MainFrame.Navigate(new SalesmanMainPage(User)); break;
            }
        }
        private void TimerSession_Tick(object sender, EventArgs e)
        {

            if (timeSession > TimeSpan.FromSeconds(1))
            {
                timeSession -= TimeSpan.FromSeconds(1);
                TextBlock_TimeSession.Text = "Оставшеевся время сеанса: " + timeSession.ToString();

                if (timeSession == timeToEndSession)
                {
                    TextBlock_TimeSession.Foreground = new SolidColorBrush(Colors.Red);
                    TextBlock_Warning.Visibility = Visibility.Visible;
                }
            }
            else
            {
                timerSession.Stop();
                App.blockedUsers.Add(new BlockedUser(User));
                MessageBox.Show("Выход из системы!");
                MainWindow.WindowFrame.Navigate(new LoginPage());
            }
        }
    }
}
