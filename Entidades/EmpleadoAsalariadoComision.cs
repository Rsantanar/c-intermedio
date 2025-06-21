
namespace GestionNomina.Entidades
{
    public class EmpleadoAsalariadoComision: EmpleadoAsalariadoBase
    {
        public EmpleadoComision DatosComision { get; set; }
        public EmpleadoAsalariadoComision(string codigo,string nombre,decimal salario,decimal ventasbrutas,decimal tarifacomision)
        :base (codigo,nombre,salario)
        {
           DatosComision =new EmpleadoComision(ventasbrutas,tarifacomision);
        }

        public override decimal CalcularSalario()
        {
            decimal bonificacion = SalarioBase * 0.10m;
            return  SalarioBase + bonificacion + DatosComision.CalcularComision();
        }

    }
}
