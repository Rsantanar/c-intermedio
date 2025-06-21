namespace GestionProducto
{
    internal class Program
    {
        static void Main(string[] args)
        {
            ProductService productService = new ProductService();

            Console.WriteLine("Seleccione una opción:");
            Console.WriteLine("1. Agregar producto");
            Console.WriteLine("2. Eliminar producto");
            Console.Write("Opción: ");

            string opcion = Console.ReadLine();

            switch (opcion)
            {
                case "1":
                    Console.Write("Ingrese el nombre del producto: ");
                    string nombre = Console.ReadLine();

                    Console.Write("Ingrese el precio: ");
                    decimal precio;
                    while (!decimal.TryParse(Console.ReadLine(), out precio))
                    {
                        Console.Write("Precio inválido. Intente de nuevo: ");
                    }

                    productService.AddProduct(nombre, precio);
                    break;

                case "2":
                    Console.Write("Ingrese el ID del producto a eliminar: ");
                    int idProducto;
                    while (!int.TryParse(Console.ReadLine(), out idProducto))
                    {
                        Console.Write("ID inválido. Intente de nuevo: ");
                    }

                    productService.DeleteProduct(idProducto);
                    break;

                default:
                    Console.WriteLine("Opción no válida.");
                    break;
            }
        }
    }
}
