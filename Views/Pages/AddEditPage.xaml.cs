using Namordnik.Model;
using Namordnik.Views.Windows;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace Namordnik.Views.Pages
{

    public partial class AddEditPage : Page
    {
        private Product Product { get; set; }

        public AddEditPage(Product product)
        {
            InitializeComponent();
            Product = product;
            btnDelete.Visibility = product.ID != 0 ? Visibility.Visible : Visibility.Collapsed;
            DataContext = product;
        }

        private void btnImages_Click(object sender, RoutedEventArgs e)
        {
            var window = new ImagesWindow();
            window.ShowDialog();
            if (window.DialogResult == true)
            {
                Product.Image = window.ImgUri;
                DataContext = null;
                DataContext = Product;
            }
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            var errors = new StringBuilder();
            if (string.IsNullOrEmpty(tbTitle.Text) || string.IsNullOrWhiteSpace(tbTitle.Text))
            {
                errors.AppendLine("Введите название");
            }
            if (string.IsNullOrEmpty(tbArticle.Text) || string.IsNullOrWhiteSpace(tbArticle.Text))
            {
                errors.AppendLine("Введите артикул");
            }
            else if (Product.ID == 0)
            {
                if (DB.entities.Products.Where(p => p.ArticleNumber == tbArticle.Text).ToList().Count != 0)
                {
                    errors.AppendLine("Артикул должен быть уникальным");
                }
            }

            if (!string.IsNullOrEmpty(tbWorkshop.Text))
            {
                if (!int.TryParse(tbWorkshop.Text, out int number))
                {
                    errors.AppendLine("Номер цеха - это целое число");
                }
                else if(number < 1)
                {
                    errors.AppendLine("Номер цеха - это неотрицательное число");
                }
            }
            if (!string.IsNullOrEmpty(tbPeople.Text))
            {
                if (!int.TryParse(tbPeople.Text, out int number))
                {
                    errors.AppendLine("Количество людей - это целое число");
                }
                else if(number < 1)
                {
                    errors.AppendLine("Количество людей - это неотрицательное число");
                }
            }
            if (string.IsNullOrEmpty(tbTitle.Text) || string.IsNullOrWhiteSpace(tbTitle.Text))
            {
                errors.AppendLine("Введите цену");
            }
            else
            {
                if (!decimal.TryParse(tbCost.Text, NumberStyles.Any,CultureInfo.InvariantCulture, out decimal cost))
                {
                    errors.AppendLine("Цена - это число");
                }
                else if (cost < 0)
                {
                    errors.AppendLine("Цена - это неотрицательное число");
                }
            }
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            if (Product.ID == 0)
            {
                DB.entities.Products.Add(Product);
            }
            DB.entities.SaveChanges();
            MessageBox.Show("Успешно добавлено");
            NavigationService.GoBack();
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Вы уверены?", "Подтверждение", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                if (Product.ProductSales.Any())
                {
                    MessageBox.Show("У продукта есть информация о его продажах агентами. Удаление запрещено");
                    return;
                }
                foreach (var item in Product.ProductMaterials)
                {
                    DB.entities.ProductMaterials.Remove(item);
                }
                foreach (var item in Product.ProductCostHistories)
                {
                    DB.entities.ProductCostHistories.Remove(item);
                }
                DB.entities.Products.Remove(Product);
                DB.entities.SaveChanges();
                MessageBox.Show("Успешно удалено");
                NavigationService.GoBack();
            }
            
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            cbType.ItemsSource = DB.entities.ProductTypes.ToList();
        }
    }
}
