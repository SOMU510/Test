using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace YCS
{
    #region DataConnection Class
    public partial class DataConnection
    {
        #region Globlal Variable Declaration

        SqlConnection sqlconn = null;
        SqlCommand sqlcmd = null;
        string connectionstring = null;
        SqlDataAdapter sqlda = null;
        Security _Security = new Security();
        #endregion

        #region public Methods
        /// <summary>
        ///  It is used to execute the sql statements like update, insert, delete 
        /// </summary>
        /// <param name="spname"> Database storeprocedure name</param>
        /// <param name="pname"> Parameter List in Executing storeprocedure </param>
        /// <returns> Output Parameter return dictionary object format(Key, Value pair)</returns>
        public Dictionary<string, object> ExecuteNonQuery(string spname, List<DBMapParam> pname)
        {
            SqlTransaction tr = null;
            try
            {
                CommandPrepare(true);

                tr = sqlconn.BeginTransaction();
                sqlcmd.Transaction = tr;

                AddCommandParameter(spname, pname);

                sqlcmd.ExecuteNonQuery();
                tr.Commit();
                sqlconn.Close();

                Dictionary<string, object> dictResult = new Dictionary<string, object>();

                for (int i = 0; i < pname?.Count(); i++)
                {
                    if (pname[i].ParameterDirection == ParameterDirection.Output || pname[i].ParameterDirection == ParameterDirection.InputOutput || pname[i].ParameterDirection == ParameterDirection.ReturnValue)
                    {
                        pname[i].Value = sqlcmd.Parameters["@" + pname[i].Name].Value;
                        dictResult.Add(pname[i].Name, pname[i].Value);
                    }
                }

                return dictResult;
            }
            catch (Exception ex)
            {
                if (tr != null)
                {
                    tr.Rollback();
                }
                throw ex;
            }
            finally
            {
                Close();
            }
        }

        /// <summary>
        ///   It is used to execute the sql statements like select and return value into datatable format
        /// </summary>
        /// <param name="spname">  Database storeprocedure name</param>
        /// <param name="pname"> Parameter List in Executing storeprocedure </param>
        /// <returns>return value into Datatable format</returns>
        public DataTable GetDatatableSP(string spname, List<DBMapParam> pname)
        {
            try
            {
                CommandPrepare(true);

                AddCommandParameter(spname, pname);

                sqlda = new SqlDataAdapter();
                DataTable DtTable = new DataTable();
                sqlda.SelectCommand = sqlcmd;
                sqlda.Fill(DtTable);
                return DtTable;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Close();
            }

        }

        /// <summary>
        ///  It is used to execute the sql statements like select and return value into dataset format
        /// </summary>
        /// <param name="spname">  Database storeprocedure name</param>
        /// <param name="pname"> Parameter List in Executing storeprocedure </param>
        /// <returns>return value into Dataset format</returns>
        public DataSet GetDatasetSP(string spname, List<DBMapParam> pname)
        {
            try
            {
                CommandPrepare(true);

                AddCommandParameter(spname, pname);

                sqlda = new SqlDataAdapter();
                DataSet ds = new DataSet();
                sqlda.SelectCommand = sqlcmd;
                sqlda.Fill(ds);
                return ds;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Close();
            }

        }

        /// <summary>
        /// It is used to get Stored Procedure Schema
        /// </summary>
        /// <param name="spname">Database Stored Procedure Name</param>
        /// <returns>Datatable With Stored Procedure Schema</returns>
        public DataTable GetSPSchema(string spname, List<DBMapParam> pname)
        {
            try
            {
                CommandPrepare(true);
                AddCommandParameter(spname, pname);
                SqlDataReader reader = sqlcmd.ExecuteReader();
                DataTable schema = reader.GetSchemaTable();
                return schema;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                Close();
            }
        }


        #endregion

        #region Private Methods
        /// <summary>
        /// Connect to Database and Open a new connection
        /// </summary>
        /// <param name="isopen">connection open or not</param>
        /// <returns>sqlconnection object</returns>
        private SqlConnection Connect(bool isopen)
        {
            try
            {
                //Normal Plain Text
                connectionstring = Convert.ToString(System.Configuration.ConfigurationManager.ConnectionStrings["DBConnectionString"]);
                if (!connectionstring.Contains("Data Source") && !connectionstring.Contains("Initial Catalog"))
                {
                    //Encrypted connectionstring to Decrypted
                    connectionstring = _Security.Decrypted(connectionstring);
                }

                sqlconn = new SqlConnection();
                sqlconn.ConnectionString = connectionstring;

                if (isopen)
                {
                    sqlconn.Open();
                }
                return sqlconn;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Close Connection of DB if Open condition
        /// </summary>
        private void Close()
        {
            try
            {
                if (sqlconn != null)
                {
                    if (sqlconn.State == ConnectionState.Open)
                    {
                        sqlconn.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Add parameter into Sql Command Parameter
        /// </summary>
        /// <param name="spname"> Database storeprocedure name</param>
        /// <param name="pname"> Parameter List in Executing storeprocedure </param>
        private void AddCommandParameter(string spname, List<DBMapParam> pname)
        {
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.CommandText = spname;

            for (int i = 0; i < pname?.Count(); i++)
            {
                SqlParameter sqlparam = new SqlParameter();

                if (pname[i].ParameterDirection == ParameterDirection.Output || pname[i].ParameterDirection == ParameterDirection.InputOutput || pname[i].ParameterDirection == ParameterDirection.ReturnValue)
                {
                    sqlparam.Direction = pname[i].ParameterDirection;
                    sqlparam.SqlDbType = pname[i].SqlDbType;
                    sqlparam.Size = pname[i].Size;
                }

                sqlparam.ParameterName = "@" + pname[i].Name;
                sqlparam.Value = pname[i].Value;
                sqlcmd.Parameters.Add(sqlparam);
            }
        }

        /// <summary>
        /// Prepare sql connection & sql command
        /// </summary>
        /// <param name="openconnection">Connection open or not</param>
        private void CommandPrepare(bool openconnection)
        {
            sqlconn = new SqlConnection();
            sqlconn = Connect(openconnection);
            sqlcmd = new SqlCommand();
            sqlcmd.Connection = sqlconn;
            sqlcmd.CommandTimeout = 3000;
        }
        #endregion
    }
    #endregion
}