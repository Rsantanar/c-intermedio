using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolApp.Entidades
{
    public class EmpleadoAdministrativo : Empleado
    {
        public string?  Departamento { get; set; }
        public string? Sueldo { get; set; }

        public override string ObtenerInformacion()
        {
            return base.ObtenerInformacion();
        }
    }
}
