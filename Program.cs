using GestionNomina.Entidades;

namespace GestionNomina
{
    internal class Program
    {
        static void Main(string[] args)
        {
            EmpleadoAsalariado empl1 =new EmpleadoAsalariado("0001","Robert",800);
            EmpleadoAsalariadoComision empl2 = new EmpleadoAsalariadoComision("0002","Pepe",600,3000,0.04m);    
            EmpleadoPorComision empl3 = new EmpleadoPorComision("0003","Juan",5000,0.5m);
            EmpleadoPorHora empl4 =new EmpleadoPorHora("0004", "Maria",20,45);
        }
    }
}
