

namespace GestionNomina.Entidades
{
    public  class EmpleadoComision
    {
        public decimal VentasBrutas { get; set; }   
        public decimal TarifaComision { get; set; }

        public EmpleadoComision(decimal ventasbrutas,decimal tarifacomision) 
            
        {
            VentasBrutas = ventasbrutas;    
            TarifaComision = tarifacomision;
        }
        public  decimal CalcularComision()
        {
           return VentasBrutas*TarifaComision;
        }
    }
}
