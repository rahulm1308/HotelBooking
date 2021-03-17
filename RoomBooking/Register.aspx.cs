using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace RoomBooking
{

    public partial class WebForm1 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into RegisterTable(FirstName, LastName, Username, Email, Password) values(@fn, @ln, @un, @email, @pass)", con);
            cmd.Parameters.AddWithValue("@fn", FirstName.Text);
            cmd.Parameters.AddWithValue("@ln", LastName.Text);
            cmd.Parameters.AddWithValue("@un", Username.Text);
            cmd.Parameters.AddWithValue("@email", Email.Text);
            cmd.Parameters.AddWithValue("@pass", Password.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Session["Username"] = Username.Text;
            Response.Redirect("Home.aspx");

        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {

        }
    }
}