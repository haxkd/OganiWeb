using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OganiWeb
{
    public class DbWork
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        public SqlDataReader reader;
        public SqlDataReader getAllProducts()
        {
            connection.Open();
            return new SqlCommand("SELECT * FROM Product", connection).ExecuteReader();
        }

    }
}