<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RawMaterials.aspx.cs" Inherits="sparklyasp.RawMaterials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Raw Materials</h1><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="RawMaterialsSource" DataKeyNames="rawMaterialsID">
        <Columns>
            <asp:BoundField DataField="rawMaterialsName" HeaderText="Material Name" 
                SortExpression="rawMaterialsName" />
            <asp:BoundField DataField="rawMaterialsPrice" HeaderText="Price" 
                SortExpression="rawMaterialsPrice" />
            <asp:BoundField DataField="rawMaterialsQty" HeaderText="Quantity" 
                SortExpression="rawMaterialsQty" />
            <asp:BoundField DataField="rawMaterialsID" HeaderText="rawMaterialsID" 
                InsertVisible="False" ReadOnly="True" SortExpression="rawMaterialsID" 
                Visible="False" />
            <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True" ShowHeader="true" />
            <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="true" ShowHeader="true" />
        </Columns>
    </asp:GridView>
    <asp:AccessDataSource ID="RawMaterialsSource" runat="server" 
        DataFile="~/App_Data/mrsparklytrent.accdb" 
        
        SelectCommand="SELECT [rawMaterialsName], [rawMaterialsPrice], [rawMaterialsQty], [rawMaterialsID] FROM [RawMaterials]" 
        DeleteCommand="DELETE FROM [RawMaterials] WHERE [rawMaterialsID] = ?" 
        InsertCommand="INSERT INTO [RawMaterials] ([rawMaterialsName], [rawMaterialsPrice], [rawMaterialsQty]) VALUES (?, ?, ?)" 
        UpdateCommand="UPDATE [RawMaterials] SET [rawMaterialsName] = ?, [rawMaterialsPrice] = ?, [rawMaterialsQty] = ? WHERE [rawMaterialsID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="rawMaterialsID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="rawMaterialsName" Type="String" />
            <asp:Parameter Name="rawMaterialsPrice" Type="Decimal" />
            <asp:Parameter Name="rawMaterialsQty" Type="Int16" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="rawMaterialsName" Type="String" />
            <asp:Parameter Name="rawMaterialsPrice" Type="Decimal" />
            <asp:Parameter Name="rawMaterialsQty" Type="Int16" />
            <asp:Parameter Name="rawMaterialsID" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
        <asp:FormView ID="FormView1" runat="server" DataSourceID="RawMaterialsSource">
        <InsertItemTemplate>
        <br />
            Material Name:<br />
            <asp:TextBox ID="txtMaterialName" runat="server" Text='<%# Bind("rawMaterialsName") %>'></asp:TextBox>
            <br />
            Price:<br />
            <asp:TextBox ID="txtMaterialPrice" runat="server" Text='<%# Bind("rawMaterialsPrice") %>'></asp:TextBox>
            <br />
            Quantity:<br />
            <asp:TextBox ID="txtQuantity" runat="server" Text='<%# Bind("rawMaterialsQty") %>'></asp:TextBox>
            <br /><br />
            <asp:Button ID="btnInsert" runat="server" Text="Insert" CommandName="Insert" />   
        </InsertItemTemplate>
        <ItemTemplate>
        <br />
            <asp:Button ID="BtnNew" runat="server" Text="Add New Raw Material" CommandName="New" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
