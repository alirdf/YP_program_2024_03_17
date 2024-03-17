using System.Linq;

namespace Namordnik.Model
{
    public partial class Product
    {
        public decimal Price
        {
            get
            {
                decimal price = 0;
                foreach (ProductMaterial item in ProductMaterials)
                {
                    price += item.Material.Cost;
                }
                return price;
            }
        }

        public string MaterialList
        {
            get
            {
                string materials = "";
                foreach (ProductMaterial item in ProductMaterials)
                {
                    materials += item.Material.Title;
                    if (item != ProductMaterials.Last())
                    {
                        materials += ", ";
                    }

                }
                return materials;
            }
        }

        public string PicturePath => Image ?? "../../products/picture.png";
    }
}
