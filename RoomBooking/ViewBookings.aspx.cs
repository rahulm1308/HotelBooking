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
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT BookingsTable.*, ReservationTable.RoomNo FROM BookingsTable FULL OUTER JOIN ReservationTable ON BookingsTable.BookingId= ReservationTable.BookingId WHERE BookingsTable.CheckInDate=@checkin", con);
            cmd.Parameters.AddWithValue("@checkin", DateTime.Today);
            SqlDataReader data = cmd.ExecuteReader();
            GridView1.DataSource = data;
            GridView1.DataBind();
            con.Close();
        }

        protected void ViewButton_Click(object sender, EventArgs e)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["dbconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            if(UserName.Text=="" & CheckInDate.Text=="")
            {
                return;
            }
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            if (CheckInDate.Text == "")
            {
                cmd.CommandText = "SELECT BookingsTable.*, ReservationTable.RoomNo FROM BookingsTable FULL OUTER JOIN ReservationTable ON BookingsTable.BookingId= ReservationTable.BookingId WHERE BookingsTable.Name=@un";
                cmd.Parameters.AddWithValue("@un", UserName.Text);
            }
            else if(UserName.Text == ""){
                cmd.CommandText = "SELECT BookingsTable.*, ReservationTable.RoomNo FROM BookingsTable FULL OUTER JOIN ReservationTable ON BookingsTable.BookingId= ReservationTable.BookingId WHERE BookingsTable.CheckInDate=@checkin";
                cmd.Parameters.AddWithValue("checkin", CheckInDate.Text);
            }
            else
            {
                cmd.CommandText = "SELECT BookingsTable.*, ReservationTable.RoomNo FROM BookingsTable FULL OUTER JOIN ReservationTable ON BookingsTable.BookingId= ReservationTable.BookingId WHERE BookingsTable.CheckInDate=@checkin AND BookingsTable.Name=@un";
                cmd.Parameters.AddWithValue("@checkin", CheckInDate.Text);
                cmd.Parameters.AddWithValue("@un", UserName.Text);
            }
            con.Open();
            SqlDataReader data = cmd.ExecuteReader();
            GridView1.DataSource = data;
            GridView1.DataBind();
            con.Close();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Response.Redirect("Dashboard.aspx?id=" + GridView1.Rows[e.RowIndex].Cells[1].Text);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}