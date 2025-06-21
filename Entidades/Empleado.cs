
namespace GestionNomina.Entidades
{
    public abstract class Empleado
    {
        public  string? CodigoEmpleado {  get; set; }    
        public string? Nombre { get; set; }
        
        public Empleado(string codigo,string nombre) 
        {
            CodigoEmpleado = codigo;
            Nombre = nombre;
        }

        public abstract decimal CalcularSalario();


    }
}
