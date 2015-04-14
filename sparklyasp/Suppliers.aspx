<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Suppliers.aspx.cs" Inherits="sparklyasp.Suppliers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Suppliers</h1><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SuppliersSource" DataKeyNames="supplierID" onrowupdating="GridView1_RowUpdating">
        <Columns>
            <asp:BoundField DataField="supplierID" HeaderText="SupplierID"
                SortExpression="supplierID" Visible="false" InsertVisible="false" ReadOnly="true" />
            <asp:BoundField DataField="supplierName" HeaderText="Supplier Name" 
                SortExpression="supplierName" />
            <asp:BoundField DataField="contactName" HeaderText="Contact Name" 
                SortExpression="contactName" />
            <asp:BoundField DataField="supplierPhone" HeaderText="Phone No" 
                SortExpression="supplierPhone" />
            <asp:BoundField DataField="supplierMobile" HeaderText="Mobile No" 
                SortExpression="supplierMobile" />
            <asp:BoundField DataField="supplierFax" HeaderText="Fax No" 
                SortExpression="supplierFax" />
            <asp:BoundField DataField="supplierEmail" HeaderText="Email" 
                SortExpression="supplierEmail" />
            <asp:BoundField DataField="supplierStreet" HeaderText="Street" 
                SortExpression="supplierStreet" />
            <asp:BoundField DataField="suburb" HeaderText="Suburb" 
                SortExpression="suburb" />
            <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
            <asp:BoundField DataField="zip" HeaderText="Post Code" SortExpression="zip" />
            <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True" ShowHeader="true" />
            <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="true" ShowHeader="true" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="SuppliersSource" runat="server" 
        DataFile="~/App_Data/mrsparklytrent.accdb" 
        SelectCommand="SELECT Suppliers.supplierID, Suppliers.supplierName, Suppliers.contactName, Suppliers.supplierPhone, Suppliers.supplierMobile, Suppliers.supplierFax, Suppliers.supplierEmail, Suppliers.supplierStreet, Suburb.suburb, Suburb.state, Suburb.zip FROM (Suburb INNER JOIN Suppliers ON Suburb.suburbID = Suppliers.suburbID)"
        UpdateCommand="UPDATE [Suppliers] SET [supplierName] = ?, [contactName] = ?,[supplierStreet] = ?, [supplierPhone] = ?, [supplierMobile] = ?, [supplierFax] = ?, [supplierEmail] = ?, [suburbID] = ? WHERE [supplierID] = ?">
        <UpdateParameters>
            <asp:Parameter Name="supplierName" Type="String" />
            <asp:Parameter Name="contactName" Type="String" />
            <asp:Parameter Name="supplierStreet" Type="String" />
            <asp:Parameter Name="supplierPhone" Type="String" />
            <asp:Parameter Name="supplierMobile" Type="String" />
            <asp:Parameter Name="supplierFax" Type="String" />
            <asp:Parameter Name="supplierEmail" Type="String" />            
            <asp:Parameter Name="suburbID" Type="Int32" />
            <asp:Parameter Name="supplierID" Type="Int32" />
       </UpdateParameters>
    </asp:AccessDataSource>
</asp:Content>
