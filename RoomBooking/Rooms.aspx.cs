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
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddBtn_Click(object sender, EventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbconnectionstring"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into RoomsTable(Type) values(@type)", con);
            cmd.Parameters.AddWithValue("@type", RoomTypeList2.SelectedValue);
            cmd.ExecuteNonQuery();
            con.Close();
            GridView1.DataBind();
            RoomTypeList2.SelectedValue = "";
        }
    }
}