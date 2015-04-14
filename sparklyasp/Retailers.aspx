<%@ Page Title="Retailers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Retailers.aspx.cs" Inherits="sparklyasp.Customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Retailers</h1><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="RetailersDataSource" DataKeyNames="retailerID" Width="895px" 
        onrowupdating="GridView1_RowUpdating">
        <Columns>
            <asp:BoundField DataField="retailerID" HeaderText="retailerID" 
                SortExpression="retailerID" InsertVisible="False" ReadOnly="True" 
                Visible="False" />
            <asp:BoundField DataField="retailerName" 
                HeaderText="Name" SortExpression="retailerName" />
            <asp:BoundField DataField="retailerContactName" HeaderText="Contact Name" 
                SortExpression="retailerContactName" />
            <asp:BoundField DataField="retailerPhone" HeaderText="Phone" 
                SortExpression="retailerPhone" />
            <asp:BoundField DataField="retailerMob" HeaderText="Mobile" 
                SortExpression="retailerMob" />
            <asp:BoundField DataField="retailerFax" HeaderText="Fax" 
                SortExpression="retailerFax" />
            <asp:BoundField DataField="retailerEmail" HeaderText="Email" 
                SortExpression="retailerEmail" />
            <asp:BoundField DataField="retailerStreet" HeaderText="Street" 
                SortExpression="retailerStreet" />
            <asp:BoundField DataField="suburb" HeaderText="Suburb" 
                SortExpression="suburb" />
            <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
            <asp:BoundField DataField="zip" HeaderText="Post Code"
                SortExpression="zip" />
            <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True" ShowHeader="true" />
            <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="true" ShowHeader="true" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="RetailersDataSource" runat="server" 
        DataFile="~/App_Data/mrsparklytrent.accdb" 
        SelectCommand="SELECT Retailers.retailerID, Retailers.retailerName, Retailers.retailerContactName, Retailers.retailerPhone, Retailers.retailerMob, Retailers.retailerFax, Retailers.retailerEmail, Retailers.retailerStreet, Suburb.suburb, Suburb.state, Suburb.zip FROM ((Retailers INNER JOIN Suburb ON Retailers.suburbID = Suburb.suburbID) INNER JOIN Suburb Suburb_1 ON Retailers.suburbID = Suburb_1.suburbID)"
        UpdateCommand="UPDATE [Retailers] SET [retailerName] = ?, [retailerContactName] = ?, [retailerPhone] = ?, [retailerMob] = ?, [retailerFax] = ?, [retailerEmail] = ?, [retailerStreet] = ?, [suburbID] = ? WHERE [retailerID] = ?">
        <UpdateParameters>
            <asp:Parameter Name="retailerName" Type="String" />
            <asp:Parameter Name="retailerContactName" Type="String" />
            <asp:Parameter Name="retailerPhone" Type="String" />
            <asp:Parameter Name="retailerMob" Type="String" />
            <asp:Parameter Name="retailerFax" Type="String" />
            <asp:Parameter Name="retailerEmail" Type="String" />
            <asp:Parameter Name="retailerStreet" Type="String" />
            <asp:Parameter Name="suburbID" Type="Int32" />
            <asp:Parameter Name="retailerID" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>

    <asp:AccessDataSource ID="AccessDataSource1" runat="server">
    </asp:AccessDataSource>

</asp:Content>
