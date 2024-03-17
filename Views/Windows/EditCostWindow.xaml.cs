using Namordnik.Model;
using System.Collections.Generic;
using System.Globalization;
using System.Windows;

namespace Namordnik.Views.Windows
{
    public partial class EditCostWindow : Window
    {
        private List<Product> products;

        public EditCostWindow(List<Product> products)
        {
            InitializeComponent();
            this.products = products;
            decimal cost = 0;
            int count = 0;
            foreach (var item in products)
            {
                cost += item.MinCostForAgent;
                count++;
            }
            tbCost.Text = (cost / count).ToString();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (decimal.TryParse(tbCost.Text, NumberStyles.Any, CultureInfo.InvariantCulture, out decimal cost))
            {
                foreach (var item in products)
                {
                    item.MinCostForAgent += cost;
                }
            }
            else
            {
                MessageBox.Show("Введите дробное число");
                return;
            }

        }
    }
}
