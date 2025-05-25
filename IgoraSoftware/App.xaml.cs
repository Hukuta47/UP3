using IgoraSoftware.Database;
using System.Linq;
using System.Windows;

namespace IgoraSoftware
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        static public IgoraEntities entities = new IgoraEntities();
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);

            entities.Clients.First();
        }
    }
}
