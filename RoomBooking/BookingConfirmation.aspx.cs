using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RoomBooking
{
    public partial class BookingConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UNText.Text = Session["Username"].ToString();
            CheckInText.Text = Session["CheckInDate"].ToString();
            CheckOutText.Text = Session["CheckOutDate"].ToString();
            AdultsText.Text = Session["Adults"].ToString();
            ChildrenText.Text = Session["Children"].ToString();
            RoomsText.Text = Session["Rooms"].ToString();
            RoomTypeText.Text = Session["RoomType"].ToString();

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