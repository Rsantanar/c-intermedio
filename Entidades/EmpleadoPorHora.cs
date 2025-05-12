
namespace GestionNomina.Entidades
{
    public  class EmpleadoPorHora: Empleado
    {
        public decimal PagoHora {  get; set; }  
        public decimal HorasTrabajada {  get; set; }    

        public EmpleadoPorHora(string codigo,string nombre,decimal pagohora,decimal horastrabajada)
            :base (codigo,nombre)
        {
            PagoHora=pagohora;
            HorasTrabajada=horastrabajada;
        }
        public override decimal CalcularSalario()
        {
            if (HorasTrabajada < 40)
                return HorasTrabajada * PagoHora;
            else
                return (40 * PagoHora) + ((HorasTrabajada - 40) * PagoHora * 1.5m);
        }
    }
}
