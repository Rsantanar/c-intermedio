
namespace GestionNomina.Entidades
{
    public abstract class EmpleadoAsalariadoBase:Empleado
    {
        public decimal SalarioBase { get; set; }    

        public EmpleadoAsalariadoBase(string codigo,string nombre,decimal salarioBase) 
            :base(codigo,nombre)
        {
            SalarioBase = salarioBase;
        }
       
    }
}
