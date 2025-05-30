using IgoraSoftware.Database;
using SkiaSharp;
using System;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;
using System.Windows.Threading;

namespace IgoraSoftware.Pages
{
    public partial class LoginPage : Page
    {
        int AttemptsLogin = 0;
        TimeSpan timeBlock = TimeSpan.FromSeconds(10);
        DispatcherTimer timerBlockLogin = new DispatcherTimer(DispatcherPriority.Render) { Interval = TimeSpan.FromSeconds(1) };
        string GeneratedNumberCaptcha;
        public LoginPage()
        {
            timerBlockLogin.Tick += TimerBlockLogin_Tick;
            InitializeComponent();
        }
        private void TimerBlockLogin_Tick(object sender, EventArgs e)
        {
            timeBlock -= TimeSpan.FromSeconds(1);
            TextBlock_TimerBlock.Text = timeBlock.Seconds.ToString();

            if (timeBlock > TimeSpan.Zero)
            {
                timerBlockLogin.Stop();
                AttemptsLogin = 0;
                Grid_BlockSplash.Visibility = Visibility.Collapsed;
                timeBlock = TimeSpan.FromSeconds(10);
            }
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string Login = TextBox_LoginEnter.Text;
            string Password = PasswordBox_PasswordEnter.Password;

            if (App.entities.Users.ToList().Exists(user => user.Login == Login))
            {
                Users User = App.entities.Users.First(user => user.Login == Login);

                if (Password == User.Password)
                {
                    if (!App.blockedUsers.Exists(u => u.blockedUser == User))
                    {
                        if (AttemptsLogin == 2 && TextBox_EnterCaptchaNumer.Text == GeneratedNumberCaptcha)
                        {
                            LoginHistory_Log login = new LoginHistory_Log()
                            {
                                UserId = User.Id,
                                LoginTime = DateTime.Now,
                                TypeLoginId = 1,
                            };
                            App.entities.LoginHistory_Log.Add(login);
                            App.entities.SaveChanges();
                            MainWindow.WindowFrame.Navigate(new MainPage(User));
                        }
                        else
                        {
                            LoginHistory_Log login = new LoginHistory_Log()
                            {
                                UserId = User.Id,
                                LoginTime = DateTime.Now,
                                TypeLoginId = 1
                            };
                            App.entities.LoginHistory_Log.Add(login);
                            App.entities.SaveChanges();
                            MainWindow.WindowFrame.Navigate(new MainPage(User));
                        }
                    }
                    else
                    {

                        MessageBox.Show($"Учетная запись разблокируется в {App.blockedUsers.Find(u => u.blockedUser == User).GetTimeLeft().Substring(0, 5)}");
                    }
                }
                else
                {
                    LoginHistory_Log login = new LoginHistory_Log()
                    {
                        UserId = User.Id,
                        LoginTime = DateTime.Now,
                        TypeLoginId = 2,
                    };
                    App.entities.LoginHistory_Log.Add(login);
                    App.entities.SaveChanges();

                    AttemptsLogin++;
                    switch (AttemptsLogin)
                    {
                        case 2:
                            ChangeCAPTChaImage_Click();
                            Grid_Captcha.Visibility = Visibility.Visible;
                        break;
                        case 3:
                            MessageBox.Show("Ну ты пиздец, бан тебе на 10 секунд дудосер");
                            Grid_BlockSplash.Visibility = Visibility.Visible;
                            timerBlockLogin.Start();

                            TextBox_LoginEnter.Text = String.Empty;
                            PasswordBox_PasswordEnter.Password = String.Empty;
                            Grid_Captcha.Visibility = Visibility.Hidden;
                            TextBox_EnterCaptchaNumer.Text = String.Empty;
                        break;
                    }

                    MessageBox.Show("Не Заебись");
                }
            }
            else
            {
                MessageBox.Show("Такого нет(");
            }
        }

        private void ChangeCAPTChaImage_Click()
        {
            var info = new SKImageInfo(200, 50);
            using (var surface = SKSurface.Create(info))
            {
                var canvas = surface.Canvas;
                Random random = new Random();
                canvas.Clear(SKColors.Azure);


                for (int i = 0; i < 5000; i++)
                {
                    double randX = random.NextDouble() * 200;
                    double randY = random.NextDouble() * 50;

                    using (var paint = new SKPaint())
                    {
                        paint.Color = new SKColor((byte)random.Next(0, 255), (byte)random.Next(0, 255), (byte)random.Next(0, 255));
                        paint.StrokeWidth = 1;
                        paint.IsAntialias = false;
                        paint.Style = SKPaintStyle.Fill;

                        // Рисуем круг
                        canvas.DrawCircle((float)randX, (float)randY, 1, paint);
                    }
                }

                for (int i = 1; i <= 5; i++)
                {
                    double randomY = -1 + (random.NextDouble() * 2);
                    int randNumber = random.Next(0, 9);
                    GeneratedNumberCaptcha += randNumber;

                    using (var typeface = SKTypeface.FromFamilyName("Comic Sans MS"))
                    using (var font = new SKFont(typeface, 32))
                    using (var Number = SKTextBlob.Create($"{randNumber}", font))
                    {

                        var textPaint = new SKPaint
                        {

                            Color = new SKColor((byte)random.Next(0, 255), (byte)random.Next(0, 255), (byte)random.Next(0, 255)),
                            IsAntialias = true,
                            BlendMode = SKBlendMode.Plus
                        };

                        canvas.DrawText(Number, i * 31, 38 + ((float)randomY * 15), textPaint);
                    }
                }

                using (SKImage image = surface.Snapshot())
                using (SKBitmap bitmap = SKBitmap.FromImage(image))
                {
                    // Конвертируем SkiaSharp-изображение в WPF BitmapImage
                    using (MemoryStream memoryStream = new MemoryStream())
                    {
                        bitmap.Encode(memoryStream, SKEncodedImageFormat.Png, 100);
                        memoryStream.Position = 0;

                        var bitmapImage = new BitmapImage();
                        bitmapImage.BeginInit();
                        bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                        bitmapImage.StreamSource = memoryStream;
                        bitmapImage.EndInit();


                        Image_PictureCAPTCha.Source = bitmapImage;
                    }
                }
            }
        }

        private void ChangeCAPTChaImage_Click(object sender, RoutedEventArgs e)
        {
            ChangeCAPTChaImage_Click();
        }
    }
}
