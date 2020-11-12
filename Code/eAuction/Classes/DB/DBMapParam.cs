using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for DBMapParam
/// </summary>
namespace YCS
{
    public class DBMapParam
    {
        public SqlDbType SqlDbType { get; set; }
        public int Size { get; set; }
        public ParameterDirection ParameterDirection { get; set; }
        public string Name { get; set; }
        public object Value { get; set; }

        public DBMapParam()
        {

        }
    }
}