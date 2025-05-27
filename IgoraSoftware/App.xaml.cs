using IgoraSoftware.Database;
using System.Collections.Generic;
using System.Linq;
using System.Windows;

namespace IgoraSoftware
{
    public partial class App : Application
    {
        static public IgoraEntities entities = new IgoraEntities();
        static public List<BlockedUser> blockedUsers = new List<BlockedUser>();
        protected override void OnStartup(StartupEventArgs e)
        {
            base.OnStartup(e);
            entities.Clients.First();
        }
    }
}
