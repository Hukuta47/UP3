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
        static public PageHelper pageHelper;
        public MainWindow()
        {
            InitializeComponent();
            pageHelper.Frame = Frame_MainFrame;
            pageHelper.Frame.Navigate(new LoginPage());
        }
    }
}
