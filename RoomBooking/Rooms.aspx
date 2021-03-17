<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Rooms.aspx.cs" Inherits="RoomBooking.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <div class="container">
        <h3 class="pt-4">Add Rooms</h3>
        <div class="row py-3">
            <asp:DropDownList ID="RoomTypeList2" class="form-control m-1" runat="server" placeholder="Room Type" Width="30%" AutoPostBack="True">
				<asp:ListItem Value="">Room Type</asp:ListItem>  
				<asp:ListItem Value="Single">Single (INR 2000) </asp:ListItem>  
				<asp:ListItem Value="Queen">Queen (INR 3000) </asp:ListItem>
				<asp:ListItem Value="King">King (INR 4000) </asp:ListItem>
				<asp:ListItem Value="Mini-Suite">Mini-Suite (INR 6000) </asp:ListItem>
				<asp:ListItem Value="Master-Suite">Master-Suite (INR 7000) </asp:ListItem>
			</asp:DropDownList>
            <asp:RequiredFieldValidator ID="AddRoomValidator" runat="server" Text="*" ControlToValidate="RoomTypeList2" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:Button ID="AddBtn" runat="server" width="30%" CssClass="btn btn-outline-success form-control m-1" OnClick="AddBtn_Click" Text="Add Room" />
        </div>

        <h3 class="pt-4">Manage Rooms</h3>

        <div class="row py-3">
            <asp:DropDownList ID="RoomTypeList" class="form-control m-1" runat="server" placeholder="Room Type" Width="30%" AutoPostBack="True">
				<asp:ListItem Value="">Room Type</asp:ListItem>  
				<asp:ListItem Value="Single">Single (INR 2000) </asp:ListItem>  
				<asp:ListItem Value="Queen">Queen (INR 3000) </asp:ListItem>
				<asp:ListItem Value="King">King (INR 4000) </asp:ListItem>
				<asp:ListItem Value="Mini-Suite">Mini-Suite (INR 6000) </asp:ListItem>
				<asp:ListItem Value="Master-Suite">Master-Suite (INR 7000) </asp:ListItem>
			</asp:DropDownList>
        </div>

        <div class="row py-3">
            <asp:GridView ID="GridView1" runat="server" EmptyDataText="No record found." CellPadding="8" ForeColor="#333333" GridLines="Horizontal" CssClass="form-control text-center" AutoGenerateColumns="False" CellSpacing="4" DataKeyNames="RoomNo" AllowPaging="True" DataSourceID="SqlDataSource1" PageSize="15">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="RoomNo" HeaderText="RoomNo" SortExpression="RoomNo" HeaderStyle-Width="150px" ItemStyle-Width="150px" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" HeaderStyle-Width="150px" ItemStyle-Width="150px" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbconnectionstring %>" SelectCommand="SELECT * FROM [RoomsTable]" FilterExpression="Type='{0}'">
                <FilterParameters>
                    <asp:ControlParameter ControlID="RoomTypeList" Name="Type" PropertyName="SelectedValue" />
                </FilterParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
