﻿using IgoraSoftware.Database;
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

namespace IgoraSoftware.Pages.ByRole.Administrator
{
    public partial class AdministratorMainPage : Page
    {
        Users User;
        public AdministratorMainPage(Users User)
        {
            this.User = User;
            InitializeComponent();
        }
        private void HistoryLogins_Click(object sender, RoutedEventArgs e)
        {
            MainPage.MainFrame.Navigate(new HistoryLoginsPage());
        }
        private void ExitUser_Click(object sender, RoutedEventArgs e)
        {
            MainPage.timerSession.Stop();
            MainWindow.WindowFrame.GoBack();
        }

        private void ResultOrdersList_Click(object sender, RoutedEventArgs e)
        {
            MainPage.TitleMain.Text = "Отчет по заказам";
            MainPage.MainFrame.Navigate(new ResultOrdersLstPage());
        }
    }
}
