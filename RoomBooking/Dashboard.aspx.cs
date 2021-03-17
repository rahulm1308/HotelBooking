using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace RoomBooking
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT BookingsTable.*, ReservationTable.RoomNo FROM BookingsTable FULL OUTER JOIN ReservationTable ON BookingsTable.BookingId= ReservationTable.BookingId WHERE BookingsTable.CheckInDate=@checkin", con);
            cmd.Parameters.AddWithValue("@checkin", DateTime.Today);
            cmd.ExecuteNonQuery();
            DataTable data = new DataTable();
            SqlDataAdapter sa = new SqlDataAdapter(cmd);
            sa.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
            Label1.Text = data.Rows.Count.ToString();
            SqlCommand cmd1 = new SqlCommand("Select COUNT(DISTINCT(Name)) from BookingsTable;", con);
            Label4.Text = cmd1.ExecuteScalar().ToString();
            con.Close();
        }
    }
}