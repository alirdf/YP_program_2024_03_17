using System;
using System.Windows;

namespace Namordnik
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            mainFrame.GoBack();
        }
        private void MainFrame_ContentRendered(object sender, EventArgs e)
        {
            btnBack.Visibility = mainFrame.CanGoBack ? Visibility.Visible : Visibility.Collapsed;
        }
    }
}
