﻿using System;
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

namespace IgoraSoftware.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddClientPage.xaml
    /// </summary>
    public partial class AddClientPage : Page
    {
        public AddClientPage()
        {
            InitializeComponent();
        }
        private void Back_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            MainPage.TitleMain.Text = "Главная страница";
            MainWindow.WindowFrame.GoBack();
        }

        private void AddClient_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
