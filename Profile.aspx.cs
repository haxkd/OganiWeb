using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OganiWeb
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            string uid = Session["uid"].ToString();

            string query = $"SELECT * FROM Users WHERE uid = '{uid}'";
            connection.Open();
            SqlDataReader reader = new SqlCommand(query,connection).ExecuteReader();
            reader.Read();
            name.InnerText = reader["uname"].ToString();
            email.InnerText = reader["uemail"].ToString();
        }
    }
}