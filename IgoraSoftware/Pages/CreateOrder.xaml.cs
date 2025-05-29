using IgoraSoftware.Database;
using SkiaSharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;


namespace IgoraSoftware.Pages
{
    public partial class CreateOrder : Page
    {
        List<ItemDataGrid> itemsDatas = new List<ItemDataGrid>();
        public CreateOrder()
        {
            InitializeComponent();
            foreach (Services service in App.entities.Services.ToList())
            {
                itemsDatas.Add(new ItemDataGrid(service.Name, service.PricePerHour));
            }
            ComboBox_CodeOrderEnter.ItemsSource = App.entities.Orders_Log.ToList();
            ComboBox_CodeOrderEnter.Text = (App.entities.Order.ToList().Last().Id + 1).ToString();
            ComboBox_CodeClientEnter.ItemsSource = App.entities.Clients.ToList();
            DataGrid_ListServices.ItemsSource = itemsDatas;
        }
        private void CheckBox_Click(object sender, RoutedEventArgs e)
        {
            var checkbox = (CheckBox)sender;
            var item = (ItemDataGrid)checkbox.DataContext;
            item.IsChecked = checkbox.IsChecked;
        }
        class ItemDataGrid
        {
            public ItemDataGrid(string NameService, decimal PricePerHourService)
            {
                this.NameService = NameService;
                this.PricePerHourService = PricePerHourService;
            }
            public bool? IsChecked { get; set; } = false;
            public string NameService { get; }
            public decimal PricePerHourService { get; }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            float scale = 5;

            Image_Barcode.Width = 205;
            Image_Barcode.Height = 250;
            string code = "4546255308042022";
            // (16 / 2) + 1 = 9

            var info = new SKImageInfo((int)Image_Barcode.Width, (int)Image_Barcode.Height);
            using (var surface = SKSurface.Create(info))
            {
                var canvas = surface.Canvas;
                Random random = new Random();
                canvas.Clear(SKColors.Yellow);
                var paint = new SKPaint() { Color = SKColors.Black };
                int indexNumber = 0;

                for (int i = 1; i < code.Length + 4; i++)
                {   
                    int number = int.Parse(code[indexNumber].ToString());
                    if (i == 1 || i == 10 || i == 19)
                    {
                        canvas.DrawRect(i * 10, 1 * scale, 0.3f * scale, 26 * scale, paint);
                        canvas.DrawRect((i * 10) + 4, 1 * scale, 0.3f * scale, 26 * scale, paint);
                    }
                    else if (number != 0)
                    {
                        canvas.DrawRect(i * 10, 1 * scale, (0.15f * number) * scale, 22.85f * scale, paint);
                        if (indexNumber != 15) indexNumber++;
                    }
                    else
                    {
                        canvas.DrawRect(i * 10, 1 * scale, 1.35f * scale, 22.85f * scale, paint);
                        if (indexNumber != 15) indexNumber++;
                    }
                }

                using (var typeface = SKTypeface.FromFamilyName("Times New Roman"))
                using (var font = new SKFont(typeface, 16))
                using (var Number = SKTextBlob.Create($"{code}", font))
                {
                    var textPaint = new SKPaint
                    {
                        Color = SKColors.Black,
                        IsAntialias = true,
                        
                    };

                    canvas.DrawText(Number, 10, 30, textPaint);
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


                        Image_Barcode.Source = bitmapImage;
                    }
                }
            }

        }
    }
}
