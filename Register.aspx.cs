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
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_Click(object sender, EventArgs e)
        {
            connection.Open();
            string checkEmail = $"SELECT * FROM Users WHERE uemail='{uemail.Text}'";
            if(new SqlCommand(checkEmail, connection).ExecuteReader().Read())
            {
                Response.Write("<script>alert('email already exist')</script>");

            }
            else
            {
                connection.Close();
                connection.Open();
                string query = $"INSERT INTO Users(uname,uemail,upassword) VALUES('{uname.Text}','{uemail.Text}','{upassword.Text}')";
                new SqlCommand(query, connection).ExecuteNonQuery();
                Response.Write("<script>alert('regsiteration successfully')</script>");
            }
        }
    }
}