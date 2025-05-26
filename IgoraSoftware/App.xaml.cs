using IgoraSoftware.Database;
using System.Linq;
using System.Windows;

namespace IgoraSoftware
{
    public partial class App : Application
    {
        static public IgoraEntities entities = new IgoraEntities();
        static public Users LoginedUser;
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);
            entities.Clients.First();
        }
    }
}
