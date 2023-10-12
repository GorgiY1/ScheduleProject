using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SH_Project
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btn_Click(object sender, RoutedEventArgs e)
        {
            Window win = new Window();
            win.Show();
        }

        private void Window_StateChanged(object sender, EventArgs e)
        {
            
            if (WindowState == WindowState.Maximized)
            {
                tb1.Width = 400;
                tb2.Width = 400;
                tb3.Width = 400;
                tb4.Width = 400;

                tb1.Height = 50;
                tb2.Height = 50;
                tb3.Height = 50;
                tb4.Height = 50;

                tb1.FontSize = 25;
                tb2.FontSize = 25;
                tb3.FontSize = 25;
                tb4.FontSize = 25;

                calendar.Visibility = Visibility.Collapsed;
                calendar2.Visibility = Visibility.Visible;
            }
            else if (WindowState == WindowState.Normal)
            {
                tb1.Width = 220;
                tb2.Width = 220;
                tb3.Width = 220;
                tb4.Width = 220;

                tb1.Height = 27;
                tb2.Height = 27;
                tb3.Height = 27;
                tb4.Height = 27;

                calendar.Visibility = Visibility.Visible;
                calendar2.Visibility = Visibility.Collapsed;
            }
        }
    }
}
