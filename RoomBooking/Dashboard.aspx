<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="RoomBooking.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <div class="container">
        <div class="row py-3">
            <div class="col-xl col-md-6 pb-3">
                <div class="card h-100">
                    <div class="row h-100 no-gutters">
                        <div class="col-6 p-3">
                            <h5>Today's Bookings</h5>
                            <h2><asp:Label ID="Label1" runat="server"></asp:Label></h2>
                        </div>
                        <div class="col bg-info text-white d-flex">
                            <h1 class="mx-auto align-self-center">
                                <i class="fa fa-2x fa-users"></i>
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl col-md-6 pb-3">
                <div class="card h-100">
                    <div class="row h-100 no-gutters">
                        <div class="col-6 p-3">
                            <h5>Room Types</h5>
                            <h2><asp:Label ID="Label2" runat="server" Text="5"></asp:Label></h2>
                        </div>
                        <div class="col bg-success text-white d-flex">
                            <h1 class="mx-auto align-self-center">
                                <i class="fa fa-2x fa-hotel"></i>
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl col-md-6 pb-3">
                <div class="card h-100">
                    <div class="row h-100 no-gutters">
                        <div class="col-6 p-3">
                            <h5>Reviews</h5>
                            <h2><asp:Label ID="Label3" runat="server"></asp:Label></h2>
                        </div>
                        <div class="col bg-warning text-white d-flex">
                            <h1 class="mx-auto align-self-center">
                                <i class="fa fa-2x fa-envelope"></i>
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl col-md-6 pb-3">
                <div class="card h-100">
                    <div class="row h-100 no-gutters">
                        <div class="col-6 p-3">
                            <h5>Customers Served</h5>
                            <h2><asp:Label ID="Label4" runat="server"></asp:Label></h2>
                        </div>
                        <div class="col bg-danger text-white d-flex">
                            <h1 class="mx-auto align-self-center">
                                <i class="fa fa-2x fa-heart"></i>
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row py-3">
            <h4>Today's Bookings</h4>
            <hr />
            <div class="col-12">
                <asp:GridView ID="GridView1" runat="server" EmptyDataText="No record found." CellPadding="8" ForeColor="#333333" GridLines="Horizontal" CssClass="text-center" AutoGenerateColumns="False" CellSpacing="4">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="BookingID" HeaderText="BookingID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="CheckInDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Check In Date" />
                    <asp:BoundField DataField="CheckOutDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Check Out Date" />
                    <asp:BoundField DataField="Adults" HeaderText="Adults" />
                    <asp:BoundField DataField="Children" HeaderText="Children" />
                    <asp:BoundField DataField="NumberOfRooms" HeaderText="Number of Rooms" />
                    <asp:BoundField DataField="RoomType" HeaderText="RoomType" />
                    <asp:BoundField DataField="RoomNo" HeaderText="RoomNo" />
                    <asp:BoundField DataField="BillAmount" HeaderText="Bill Amount" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
            </div>
        </div>

    </div>

</asp:Content>
