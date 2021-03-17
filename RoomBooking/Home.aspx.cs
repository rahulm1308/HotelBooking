using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace RoomBooking
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                ProfileLink.Visible = false;
            }
            else
            {
                RegisterLink.Visible = false;
            }
            DateTime date = DateTime.Today.Date;
            String today = date.ToString("yyyy-MM-dd");
            String maxDate = date.AddDays(45).ToString("yyyy-MM-dd");
            CheckInDate.Attributes["min"] = today;
            CheckOutDate.Attributes["min"] = today;
            CheckInDate.Attributes["max"] = maxDate;
            CheckOutDate.Attributes["max"] = maxDate;
        }


        protected void BookBtn_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["dbconnectionstring"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM RoomsTable WHERE RoomNo NOT IN(SELECT DISTINCT RoomNo FROM ReservationTable WHERE CheckInDate <= @checkout AND CheckOutDate >= @checkin) and Type =@type", con);
                cmd.Parameters.AddWithValue("@checkin", CheckInDate.Text);
                cmd.Parameters.AddWithValue("@checkout", CheckOutDate.Text);
                cmd.Parameters.AddWithValue("@type", RoomTypeList.SelectedValue);
                SqlDataReader reader = cmd.ExecuteReader();
                int count = 0;
                while (reader.Read())
                {
                    count += 1;
                }
                if (count >= int.Parse(Rooms.Text))
                {
                    Session["CheckInDate"] = CheckInDate.Text;
                    Session["CheckOutDate"] = CheckOutDate.Text;
                    Session["Adults"] = Adults.Text;
                    Session["Children"] = Children.Text;
                    Session["Rooms"] = Rooms.Text;
                    Session["RoomType"] = RoomTypeList.SelectedValue;
                    Response.Redirect("BookingConfirmation.aspx");
                }
                else
                {
                    ErrorLabel.Text = "Sorry, room with current parameters is not available.";
                }
            }
            else
            {
                Response.Redirect("Login.aspx");

            }
        }

        
    }
}