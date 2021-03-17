<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="RoomBooking.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hotel Room Booking</title>
    <style>
        *{
            margin-top: 10px;
            padding:10px;
        }
        body{
            background: linear-gradient(90deg, rgb(203,228,222), #FFF);
        }
        .card {
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
          background: rgb(203,228,204);background: -moz-linear-gradient(top, rgba(203,228,204,1) 0%, rgba(180,212,221,1) 100%);background: -webkit-linear-gradient(top, rgba(203,228,204,1) 0%,rgba(180,212,221,1) 100%);background: linear-gradient(to bottom, rgba(203,228,204,1) 0%,rgba(180,212,221,1) 100%);filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cbe4cc', endColorstr='#b4d4dd',GradientType=0 );
          border-radius: 30px;
          max-width: 400px;
          position: absolute;
          text-align: center;
          top: 50%;
          left: 50%;
          transform: translateX(-50%) translateY(-50%);
        }

        .avatar{
            vertical-align: middle;
            width: 150px;
            height: 150px;
            border-radius: 50%;
        }   

        table{
            text-align:left;
            padding: 10px;
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
            <img src="images/profile-icon.jpg" alt="" class="avatar"/>
            <h1>
                <asp:Label ID="UNText" runat="server" ForeColor="Red"></asp:Label>
            </h1>
            
            <table>
                <tr>
                    <td class="auto-style3">First Name</td>
                    <td class="auto-style4">
                        <asp:Label ID="FNText" runat="server" ForeColor="#000099"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Last Name</td>
                    <td class="auto-style1">
                        <asp:Label ID="LNText" runat="server" ForeColor="#000099"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Email</td>
                    <td class="auto-style1">
                        <asp:Label ID="EmailText" runat="server" ForeColor="#000099"></asp:Label>
                    </td>
                </tr>
            </table>
            <p>
                <asp:Button ID="UpdateButton" runat="server" Text="Update" CssClass="button" PostBackUrl="~/Update.aspx" OnClick="UpdateButton_Click"/>
                <asp:Button ID="MyBooking" runat="server" Text="My Booking" CssClass="button"  PostBackUrl="~/MyBooking.aspx" OnClick="MyBooking_Click"/>
                <asp:Button ID="LogoutBuuton" runat="server" Text="Log Out" CssClass="button" OnClick="LogoutBuuton_Click"/>
                <asp:Button ID="DeleteButton" runat="server" Text="Delete Your Account" CssClass="button" OnClick="DeleteButton_Click" onClientClick=" return confirm('Are you sure?\nYou will no longer be able to access this account.')" />
            </p>
        </div>
    </form>
</body>
</html>
