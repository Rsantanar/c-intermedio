using Notificaciones.Entidades;

namespace Notificaciones
{
    internal class Program
    {
        static void Main(string[] args)
        {
           
            EmailService email = new EmailService();  
            SmsService sms = new SmsService();  
         

            Console.WriteLine("Seleccione el tipo de notificación:");
            Console.WriteLine("1. Email");
            Console.WriteLine("2. SMS");
            Console.Write("Opción: ");
            string option = Console.ReadLine();

            Console.Write("Ingrese el destinatario (email o número): ");
            string recipient = Console.ReadLine();

            Console.Write("Ingrese el mensaje: ");
            string message = Console.ReadLine();

            if (option == "1")
            {
                email.SendEmail(recipient, message);
            }
            else if (option == "2")
            {
                sms.SendSms(recipient, message);
            }
            else
            {
                Console.WriteLine("Opción no válida.");
            }
        }
    }
}
