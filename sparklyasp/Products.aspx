<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="sparklyasp.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Products</h1> <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="ProductsDataSource" DataKeyNames="productID">
        <Columns>
            <asp:BoundField DataField="productBrandName" HeaderText="Brand Name" 
                SortExpression="productBrandName" />
            <asp:BoundField DataField="productCostPrice" HeaderText="Cost Price" 
                SortExpression="productCostPrice" />
            <asp:BoundField DataField="productRetailPrice" HeaderText="Retail Price" 
                SortExpression="productRetailPrice" />
            <asp:BoundField DataField="productQty" HeaderText="Quantity" 
                SortExpression="productQty" />
            <asp:BoundField DataField="productID" HeaderText="productID" 
                InsertVisible="False" ReadOnly="True" SortExpression="productID" 
                Visible="False" />
            <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True" ShowHeader="true" />
            <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="true" ShowHeader="true" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="ProductsDataSource" runat="server" 
        DataFile="~/App_Data/mrsparklytrent.accdb" 
        
        SelectCommand="SELECT [productBrandName], [productCostPrice], [productRetailPrice], [productQty], [productID] FROM [Products]" 
        DeleteCommand="DELETE FROM [Products] WHERE [productID] = ?" 
        InsertCommand="INSERT INTO [Products] ([productBrandName], [productCostPrice], [productRetailPrice], [productQty]) VALUES (?, ?, ?, ?)" 
        UpdateCommand="UPDATE [Products] SET [productBrandName] = ?, [productCostPrice] = ?, [productRetailPrice] = ?, [productQty] = ? WHERE [productID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="productID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="productBrandName" Type="String" />
            <asp:Parameter Name="productCostPrice" Type="Decimal" />
            <asp:Parameter Name="productRetailPrice" Type="Decimal" />
            <asp:Parameter Name="productQty" Type="Int16" />
           
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="productBrandName" Type="String" />
            <asp:Parameter Name="productCostPrice" Type="Decimal" />
            <asp:Parameter Name="productRetailPrice" Type="Decimal" />
            <asp:Parameter Name="productQty" Type="Int16" />
            <asp:Parameter Name="productID" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <asp:FormView ID="FormView1" runat="server" DataSourceID="ProductsDataSource">
        <InsertItemTemplate>
        <br />
            Brand Name:<br />
            <asp:TextBox ID="txtBrandName" runat="server" Text='<%# Bind("productBrandName") %>'></asp:TextBox>
            <br />
            Cost Price:<br />
            <asp:TextBox ID="txtCostPrice" runat="server" Text='<%# Bind("productCostPrice") %>'></asp:TextBox>
            <br />
            Retail Price:<br />
            <asp:TextBox ID="txtRetailPrice" runat="server" Text='<%# Bind("productRetailPrice") %>'></asp:TextBox>
            <br />
            Quantity:<br />
            <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("productQty") %>'></asp:TextBox>
            <br /><br />
            <asp:Button ID="btnInsert" runat="server" Text="Insert" CommandName="Insert" />   
        </InsertItemTemplate>
        <ItemTemplate>
        <br />
            <asp:Button ID="BtnNew" runat="server" Text="Add New Product" CommandName="New" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
