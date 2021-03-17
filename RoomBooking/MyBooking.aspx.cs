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
    public partial class MyBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UNText.Text = Session["Username"].ToString();
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT  [BookingID], [CheckInDate], [CheckOutDate], [Adults], [Children], [NumberOfRooms], [RoomType], [BillAmount] FROM [BookingsTable] WHERE Name=@un", con);
            cmd.Parameters.AddWithValue("@un", Session["Username"]);
            mydata.DataSource = cmd.ExecuteReader();
            mydata.DataBind();
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    }
}