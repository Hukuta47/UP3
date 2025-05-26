using IgoraSoftware.Pages;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;


namespace IgoraSoftware
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            PageHelper.Frame = Frame_MainFrame;
            PageHelper.Frame.Navigate(new LoginPage());
        }
    }
}
