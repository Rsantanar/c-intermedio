﻿namespace Biblioteca.web.Data
{
    public class Categoria
    {
        public int CategoriaId { get; set; }    
        public string? Descripcion { get; set; }
        public bool Estado { get; set;}
        public DateTime FechaCreacion { get;   set;}   
        public int? UsuarioCreacionId { get;   set; }
        

    }
}
