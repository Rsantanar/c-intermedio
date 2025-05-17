
namespace Notificaciones.Entidades
{
    public class EmailService 
    {
        public void SendEmail(string email, string message)
        {
            Console.WriteLine($"Enviando Email a {email}: {message}");
        }
    }
}
