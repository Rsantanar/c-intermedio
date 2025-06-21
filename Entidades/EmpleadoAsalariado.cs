
namespace GestionNomina.Entidades
{
    public  class EmpleadoAsalariado : EmpleadoAsalariadoBase
    {
      
        public EmpleadoAsalariado(string codigo, string nombre, decimal salarioBase)
            : base(codigo, nombre,salarioBase)
        {
            
        }
        public override decimal CalcularSalario()
        {
            return SalarioBase;
        }

    }
}
