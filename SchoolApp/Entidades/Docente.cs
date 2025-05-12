

using System.Runtime.CompilerServices;

namespace SchoolApp.Entidades
{
    public sealed class Docente: Empleado
    {
        public override string ObtenerInformacion()
        {
            // aqui se define los metodos excluysivos para el comportamiento de la clase docente
            throw new NotImplementedException();    
        }
    }
}
