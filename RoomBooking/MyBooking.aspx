<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyBooking.aspx.cs" Inherits="RoomBooking.MyBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title></title>
    <style type="text/css">
        *{
            margin-top: 10px;
            padding:10px;
        }
        body{
            background: linear-gradient(90deg, rgb(203,228,222), #FFF);
        }
        .card {
          position: absolute;
          text-align: center;
          top: 50%;
          left: 50%;
          transform: translateX(-50%) translateY(-50%);
        }

        .button {
          border-radius: 10px;
          outline: 0;
          display: inline-block;
          padding: 8px;
          color: white;
          background-color: #000;
          text-align: center;
          cursor: pointer;
          width: 80%;
          font-size: 18px;
        }

        button:hover, a:hover {
          opacity: 0.7;
        }
        .auto-style1 {
            width: 264px;
        }
        .auto-style2 {
            width: 322px;
        }
        .auto-style3 {
            width: 322px;
        }
        .auto-style4 {
            width: 264px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="card">
        <h1>
            <asp:Label ID="UNText" runat="server" ForeColor="Red"></asp:Label>
        </h1>
            
        <asp:GridView ID="mydata" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="269px" Width="849px" GridLines="Vertical" EmptyDataText="No record found.">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="BookingID" HeaderText="BookingID" SortExpression="BookingID" />
                <asp:BoundField DataField="CheckInDate" HeaderText="CheckInDate" SortExpression="CheckInDate" DataFormatString="{0:dd/MM/yyyy}"/>
                <asp:BoundField DataField="CheckOutDate" HeaderText="CheckOutDate" SortExpression="CheckOutDate" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Adults" HeaderText="Adults" SortExpression="Adults" />
                <asp:BoundField DataField="Children" HeaderText="Children" SortExpression="Children" />
                <asp:BoundField DataField="NumberOfRooms" HeaderText="NumberOfRooms" SortExpression="NumberOfRooms" />
                <asp:BoundField DataField="RoomType" HeaderText="RoomType" SortExpression="RoomType" />
                <asp:BoundField DataField="BillAmount" HeaderText="BillAmount" SortExpression="BillAmount" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
            
        <p>
            <asp:Button ID="Button1" runat="server" Text="Back" Width="145px" OnClick="Button1_Click" Height="42px" class="button"></asp:Button>
               
        </p>
    </div>
</form>
</body>
</html>

