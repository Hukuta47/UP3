using IgoraSoftware.Database;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Metadata.Edm;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Threading;

namespace IgoraSoftware
{
    public class BlockedUser
    {
        private TimeSpan TimeBlock { get; set; } = new TimeSpan(0, 15, 0);
        private TimeSpan TimeUnblock;
        private DispatcherTimer Timer { get; } = new DispatcherTimer(DispatcherPriority.Background) { Interval = TimeSpan.FromMinutes(1) };
        public Users blockedUser { get; }
        public BlockedUser(Users blockedUser)
        {
            this.blockedUser = blockedUser;
            TimeUnblock = TimeSpan.Parse(DateTime.Now.ToShortTimeString()) + TimeBlock;
            Timer.Tick += Timer_Tick;
            Timer.Start();
        }
        private void Timer_Tick(object sender, EventArgs e)
        {
            if (TimeBlock != TimeSpan.Zero)
            {
                TimeBlock -= TimeSpan.FromMinutes(1);
            }
            else
            {
                App.blockedUsers.Remove(this);
                Console.WriteLine("Вход разрешен!");
            }
        }
        public string GetTimeLeft()
        {
            return TimeUnblock.ToString();
        }
    }
}
