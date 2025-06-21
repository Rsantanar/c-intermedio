
using System.Diagnostics.CodeAnalysis;

namespace CalcularSalario
{
    public  class Payroll

    {
        // se creo este metodo para que poder reutilizarlo
        public decimal CalculateNetoSalary(decimal salarioBruto)
        {
            decimal tax = salarioBruto * 0.18m;
            decimal bonus = salarioBruto * 0.05m;
            
            return salarioBruto -tax+bonus;
        }
        public decimal CalculateSalaryForFullTime(decimal baseSalary)
        {
            return CalculateNetoSalary(baseSalary);

           // decimal tax = baseSalary*0.18m;
           // decimal bonus = baseSalary * 0.05m;
          //  return baseSalary-tax+bonus;
        }

        public decimal CalculateSalaryForPartTime(decimal hourlyRate, int hourworked )
        {
            
            
            decimal salary = hourlyRate * hourworked;

           // decimal tax = salary * 0.18m;
           //decimal bonus = salary * 0.05m;
            
            return CalculateNetoSalary(salary);
        }
    }
}
