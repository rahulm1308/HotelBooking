using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Sockets;
using System.Web.Services.Description;

namespace RoomBooking
{
    public partial class PaymentsPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime checkIn = Convert.ToDateTime(Session["CheckInDate"]);
            DateTime checkOut = Convert.ToDateTime(Session["CheckOutDate"]);
            TimeSpan difference = checkOut - checkIn;
            int room = 0, days = difference.Days;

            if (days == 0)
            {
                days = 1;
            }
            string roomType = Session["RoomType"].ToString();
            if (roomType == "Single")
            {
                room = 2000;
            }
            else if (roomType == "Queen")
            {
                room = 3000;
            }
            else if (roomType == "King")
            {
                room = 4000;
            }
            else if (roomType == "Mini-Suite")
            {
                room = 6000;
            }
            else if (roomType == "Master-Suite")
            {
                room = 7000;
            }
            int subtotal = (room * days * int.Parse(Session["Rooms"].ToString()));
            SubTotalText.Text = subtotal.ToString();
            float taxes = (12 * subtotal) / 100;
            TaxesText.Text = taxes.ToString();
            TotalText.Text = (subtotal + taxes).ToString();
            CheckInText.Text = Session["CheckInDate"].ToString();
            CheckOutText.Text = Session["CheckOutDate"].ToString();
            RoomsText.Text = Session["Rooms"].ToString();
            RoomTypeText.Text = Session["RoomType"].ToString();
        }

        protected void PaymentButton_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            DateTime ts = DateTime.Now;
            SqlCommand cmd = new SqlCommand("Insert into BookingsTable(Name, CheckInDate, CheckOutDate, Adults, Children, NumberOfRooms, RoomType, TimeStamp,BillAmount) Values" +
                "(@name, @checkindate, @checkoutdate, @adults, @children, @noofrooms, @roomtype, @timestamp, @bill); SELECT CAST(SCOPE_IDENTITY() AS INT)", con);
            cmd.Parameters.AddWithValue("@name", Session["Username"]);
            cmd.Parameters.AddWithValue("@checkindate", Session["CheckInDate"]);
            cmd.Parameters.AddWithValue("@checkoutdate", Session["CheckOutDate"]);
            cmd.Parameters.AddWithValue("@adults", Session["Adults"]);
            cmd.Parameters.AddWithValue("@children", Session["Children"]);
            cmd.Parameters.AddWithValue("@noofrooms", Session["Rooms"]);
            cmd.Parameters.AddWithValue("@roomtype", Session["RoomType"]);
            cmd.Parameters.AddWithValue("@timestamp", ts);
            cmd.Parameters.AddWithValue("@bill", TotalText.Text);
            int bookingid = (int)cmd.ExecuteScalar();
            
            int i = 0;
            while (i < int.Parse(Session["Rooms"].ToString()))
            {
                SqlCommand cmd1 = new SqlCommand("SELECT * FROM RoomsTable WHERE RoomNo NOT IN(SELECT DISTINCT roomNo FROM ReservationTable WHERE CheckInDate <= @checkout AND CheckOutDate >= @checkin) and Type =@type", con);
                cmd1.Parameters.AddWithValue("@checkin", Session["CheckInDate"]);
                cmd1.Parameters.AddWithValue("@checkout", Session["CheckOutDate"]);
                cmd1.Parameters.AddWithValue("@type", Session["RoomType"]);
                int roomno = (int)cmd1.ExecuteScalar();

                SqlCommand cmd2 = new SqlCommand("Insert into ReservationTable(BookingID, CheckInDate, CheckOutDate, RoomNo) Values" +
                    "(@bookingid, @checkindate, @checkoutdate, @roomno)", con);
                cmd2.Parameters.AddWithValue("@bookingid", bookingid);
                cmd2.Parameters.AddWithValue("@checkindate", Session["CheckInDate"]);
                cmd2.Parameters.AddWithValue("@checkoutdate", Session["CheckOutDate"]);
                cmd2.Parameters.AddWithValue("@roomno", roomno);
                cmd2.ExecuteNonQuery();
                i++;
            }
            con.Close();
            string un = Session["Username"].ToString();
            Session.Clear();
            Session["Username"] = un;
            Response.Redirect("Home.aspx");

        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            string un = Session["Username"].ToString();
            Session.Clear();
            Session["Username"] = un;
            Response.Redirect("Home.aspx");
        }
    }
}