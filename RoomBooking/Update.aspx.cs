using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace RoomBooking
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["dbconnectionstring"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                if (Session["Username"] != null)
                {
                    SqlCommand cmd = new SqlCommand("SELECT * from RegisterTable WHERE Username=@un", con);
                    cmd.Parameters.AddWithValue("@un", Session["Username"].ToString());
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            FNText.Text = Convert.ToString(reader["FirstName"]);
                            LNText.Text = Convert.ToString(reader["LastName"]);
                            EmailText.Text = Convert.ToString(reader["EMail"]);

                        }
                    }
                }
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE RegisterTable SET FirstName=@fn, LastName=@ln, EMail=@email WHERE Username=@un", con);
            cmd.Parameters.AddWithValue("@fn", FNText.Text);
            cmd.Parameters.AddWithValue("@ln", LNText.Text);
            cmd.Parameters.AddWithValue("@email", EmailText.Text);
            cmd.Parameters.AddWithValue("@un", Session["Username"].ToString());
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Profile.aspx");
        }
    }
}