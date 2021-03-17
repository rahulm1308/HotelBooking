using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.ComponentModel.DataAnnotations;

namespace RoomBooking
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * from RegisterTable WHERE Username=@un", con);
            cmd.Parameters.AddWithValue("@un", Username.Text);
            SqlDataReader reader = cmd.ExecuteReader();
            string pass = "";
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    pass = Convert.ToString(reader["Password"]);
                }
            }
            if(pass == "")
            {
                ErrorLabel.Text = "No such user exixts.";
            }
            else
            {
                if(Password.Text == pass)
                {
                    Session["Username"] = Username.Text;
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    ErrorLabel.Text = "Username or Password didn't match";
                }
            }
            con.Close();
        }
    }
}
