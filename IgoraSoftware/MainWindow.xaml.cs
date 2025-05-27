using IgoraSoftware.Pages;
using IgoraSoftware.Pages.ByRole.ShiftSupervisor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;


namespace IgoraSoftware
{
    public partial class MainWindow : Window
    {
        static public Frame WindowFrame { get; set; }
        public MainWindow()
        {
            InitializeComponent();
            WindowFrame = Frame_MainFrame;
            WindowFrame.Navigate(new LoginPage());
        }
    }
}
