
namespace Notificaciones.Entidades
{
    public class LoggerService
    {
        public void LogNotification(string message)
        {
            Console.WriteLine($"Notificación registrada en logs: {message}");
        }
    }
}
