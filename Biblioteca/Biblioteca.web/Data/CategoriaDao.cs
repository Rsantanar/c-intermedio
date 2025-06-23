namespace Biblioteca.web.Data
{
    using Biblioteca.web.Exceptions;
    using Biblioteca.web.Result;
    using Microsoft.AspNetCore.Mvc.ModelBinding.Metadata;
    using Microsoft.Data.SqlClient;
    public class CategoriaDao : ICategoriaDao
    {
        private readonly string _connString;
        private readonly IConfiguration _configuration;
        private readonly ILogger<CategoriaDao> _logger;

        public CategoriaDao(string connString, IConfiguration configuration, ILogger<CategoriaDao> logger)
        {
            _connString = connString;
            _configuration = configuration;
            _logger = logger;
        }
        public async Task<OperationResult> GetAllAsync()
        {
            OperationResult Opresult = new OperationResult();   
            try 
            {
                using (var connection =new SqlConnection(this._connString))
                {
                    using (var command =new SqlCommand("",connection))
                    {
                        command.CommandType= System.Data.CommandType.StoredProcedure;

                        await connection.OpenAsync();
                        var reader= await command.ExecuteReaderAsync();

                        if (reader.HasRows) 
                        {
                            List<Categoria> categorias = new List<Categoria>();
                            while (reader.HasRows)
                            {
                                Categoria categoria = new Categoria
                                {
                                    CategoriaId = reader.GetInt32(0),
                                    Descripcion = reader.GetString(1),
                                    Estado= reader.GetBoolean(2),
                                    FechaCreacion= reader.GetDateTime(3)

                                };
                                categorias.Add(categoria);
                            }
                        }
                    }
                }
            } catch (Exception ex)
            {
                _logger.LogError($"Error mostrando la categoria{ex.Message}", ex.ToString());

            }
            return Opresult;
        }
        public  async Task<OperationResult> GetByIdAsync(int id)
        {
            OperationResult Opresult = new OperationResult();   
            try
            {
                using (var connection =new SqlConnection(this._connString))
                {
                    using (var command = new SqlCommand("pasar procedimiento",connection))
                    {
                        command.CommandType=System.Data.CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@p_categoriaId",id);

                        await connection.OpenAsync();
                        var reader =await command.ExecuteReaderAsync();
                        if (reader.HasRows)
                        {
                            reader.Read();
                            Categoria categoria = new Categoria
                            {
                                CategoriaId   = reader.GetInt32(0),
                                Descripcion   = reader.GetString(1),
                                Estado        = reader.GetBoolean(2),
                                FechaCreacion = reader.GetDateTime(3)
                            };
                        }
                        else 
                        {
                           
                        }
                        
                    }
                }
                {
                    
                }
            } catch (Exception ex)
            {
                _logger.LogError($"Error mostrando la categoria{ex.Message}", ex.ToString());
            }

            return Opresult;
        }
        public async Task<OperationResult> AddAsync(Categoria categoria)
        {
            OperationResult Opresult = new OperationResult();
            try
            {
                //if (categoria == null)
                //{
                //    Opresult = OperationResult.Failure("La categoria no puede ser nula ");
                //}
                //if (string.IsNullOrEmpty(categoria.Descripcion))
                //{
                //    Opresult = OperationResult.Failure("La descripcion de la categoria no puede ser nula o vacia");
                //}   
                using (var connection = new SqlConnection(this._connString))
                {
                    using (var command = new SqlCommand("Seguridad.GuardandoCategoria", connection))
                    {
                        command.CommandType = System.Data.CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@nombre", categoria!.Descripcion);
                        command.Parameters.AddWithValue("@estado", categoria.Estado);
                        command.Parameters.AddWithValue("@FechaCreacion", categoria.FechaCreacion);

                        SqlParameter p_result = new SqlParameter("@p_resul", System.Data.SqlDbType.VarChar)
                        {
                            Direction = System.Data.ParameterDirection.Output
                        };
                        command.Parameters.Add(p_result);

                        await connection.OpenAsync();
                        await command.ExecuteNonQueryAsync();

                        var result = (string)p_result.Value;

                        if (result != "Ok")
                        {
                            Opresult = OperationResult.Failure($"Error agregando la categoria {result}");
                        }
                        else 
                        {
                            Opresult = OperationResult.Success(result);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error agregando categoria {ex.Message}", ex.ToString());
            }
            return Opresult;
        }
        public async Task<OperationResult> UpdateAsync(Categoria Categoria)
        {
            OperationResult Opresult = new OperationResult();   
            try
            {
                using (var connection =new SqlConnection(this._connString))
                {
                    using (var command = new SqlCommand("",connection))
                    {
                        command.CommandType = System.Data.CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@p_categoriaId",Categoria.CategoriaId);
                        command.Parameters.AddWithValue("@p_descripcion",Categoria.Descripcion);
                        command.Parameters.AddWithValue("@p_estado",Categoria.Estado);
                        command.Parameters.AddWithValue("@p_fechaModify",DateTime.Now);
                        
                         SqlParameter p_result = new SqlParameter("@p_result", System.Data.SqlDbType.VarChar)
                        {
                            Direction = System.Data.ParameterDirection.Output
                        };
                        command.Parameters.Add(p_result);
                        await connection.OpenAsync();
                        await command.ExecuteNonQueryAsync();

                        var result = (string)p_result.Value;

                        if (result != "Ok")
                           Opresult = OperationResult.Failure($"Error actualizando la categoria {result}");
                        else
                            Opresult = OperationResult.Success(result);
                    }

                }
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error actualizando la categoria {ex.Message}", ex.ToString());
                Opresult = OperationResult.Failure($"Error actualizando la categoria {ex.Message}");
            }
            return Opresult;

        }
    }
}
