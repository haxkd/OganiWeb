using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Configuration;

namespace OganiWeb.Admin
{
    public partial class AddCategory : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SaveCategory_Click(object sender, EventArgs e)
        {
            string name = CategoryName.Text;
            connection.Open();
            SqlCommand cmd = new SqlCommand($"INSERT INTO Category VALUES('{name}')",connection);
            cmd.ExecuteNonQuery();
        }
    }
}