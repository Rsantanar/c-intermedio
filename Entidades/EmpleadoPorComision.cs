
namespace GestionNomina.Entidades
{
    public class EmpleadoPorComision:Empleado
    {
      public EmpleadoComision DatosComision { get; set; }

        public EmpleadoPorComision(string codigo,string nombre,decimal ventasBrutas,decimal tarifacomision)
            :base (codigo,nombre)
        {
            DatosComision = new EmpleadoComision(ventasBrutas, tarifacomision);
        }
        public override decimal CalcularSalario()
        {
            return DatosComision.CalcularComision();
        }
    }
}
