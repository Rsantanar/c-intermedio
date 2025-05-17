
namespace GestionProducto
{
    public class ProductService
    {
        public void AddProduct(string name, decimal price)
        {
            Console.WriteLine($"pProduct {name} added with price {price}");
        }
        public void DeleteProduct (int productId)
        {
            Console.WriteLine($"product{productId}deleted");
        }
        
    }
}
