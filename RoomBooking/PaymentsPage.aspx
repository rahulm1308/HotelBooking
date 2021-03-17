<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentsPage.aspx.cs" Inherits="RoomBooking.PaymentsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            <h2 style="color: blue;">
               Make Payment
            </h2>
            <table>
                <tr>
                    <td class="auto-style3">Check In</td>
                    <td class="auto-style4">
                        <asp:Label ID="CheckInText" runat="server" ForeColor="#000099"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Check Out</td>
                    <td class="auto-style1">
                        <asp:Label ID="CheckOutText" runat="server" ForeColor="#000099"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">No. of Rooms</td>
                    <td class="auto-style1">
                        <asp:Label ID="RoomsText" runat="server" ForeColor="#000099"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Room Type</td>
                    <td class="auto-style1">
                        <asp:Label ID="RoomTypeText" runat="server" ForeColor="#000099"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Sub Total</td>
                    <td class="auto-style1">
                        <asp:Label ID="SubTotalText" runat="server" ForeColor="#000099"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Taxes</td>
                    <td class="auto-style1">
                        <asp:Label ID="TaxesText" runat="server" ForeColor="#000099"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Total Amount</td>
                    <td class="auto-style1">
                        <asp:Label ID="TotalText" runat="server" ForeColor="#000099"></asp:Label>
                    </td>
                </tr>
            </table>
            <p>
                <asp:Button ID="PaymentButton" runat="server" Text="Pay" CssClass="button" OnClick="PaymentButton_Click" />
                <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="button" OnClick="CancelButton_Click" />
            </p>
        </div>
    </form>
</body>
</html>
