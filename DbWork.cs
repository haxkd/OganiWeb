using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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


        public SqlDataReader getCartProducts(string uid) {
            connection.Open();
            return new SqlCommand($"select * from Product join Cart on Product.ProductId = Cart.pid where uid = '{uid}'", connection).ExecuteReader();
        }

        public DataTable getCheckoutOrder(string uid)
        {
            SqlCommand cmd = new SqlCommand($"select * from CheckoutOrder where uid = '{uid}' ORDER BY CheckoutOrderId DESC ", connection);
            SqlDataAdapter rd = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            rd.Fill(table);
            return table;
        }
        public DataTable getCheckoutProduct(string oid)
        {
            SqlCommand cmd = new SqlCommand($"select * from CheckoutProduct where CheckoutOrderId = '{oid}'", connection);
            SqlDataAdapter rd = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            rd.Fill(table);
            return table;
        }

    }
}