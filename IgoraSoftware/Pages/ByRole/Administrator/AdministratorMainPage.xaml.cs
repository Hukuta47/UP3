using IgoraSoftware.Database;
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
    }
}
