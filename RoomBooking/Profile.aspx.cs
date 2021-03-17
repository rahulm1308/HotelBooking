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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            if (Session["Username"] != null)
            {
                SqlCommand cmd = new SqlCommand("SELECT * from RegisterTable WHERE Username=@un", con);
                cmd.Parameters.AddWithValue("@un", Session["Username"].ToString());
                SqlDataReader reader = cmd.ExecuteReader();
                if(reader.HasRows){
                    while (reader.Read())
                    {
                        UNText.Text = Session["Username"].ToString();
                        FNText.Text = Convert.ToString(reader["FirstName"]);
                        LNText.Text = Convert.ToString(reader["LastName"]);
                        EmailText.Text = Convert.ToString(reader["EMail"]);


                    }
                }
            }
            con.Close();
        }

        protected void LogoutBuuton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            FormsAuthentication.RedirectToLoginPage();
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {

        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            if (Session["Username"] != null)
            {
                SqlCommand cmd = new SqlCommand("DELETE from RegisterTable WHERE Username=@un", con);
                cmd.Parameters.AddWithValue("@un", Session["Username"].ToString());
                cmd.ExecuteNonQuery();
            }
            con.Close();
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected void MyBooking_Click(object sender, EventArgs e)
        {

        }
    }
}