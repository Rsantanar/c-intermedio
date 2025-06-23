namespace Biblioteca.web.Exceptions
{
    public class CategoriaException : Exception
    {
        public CategoriaException(string message): base(message)  
        {
        }
        public CategoriaException(string message, Exception innerException) :base (message, innerException)  
        {
        }
    }
}
