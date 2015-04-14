<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="True" CodeBehind="PurchaseOrders.aspx.cs" Inherits="sparklyasp.PurchaseOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link rel="Stylesheet" type="text/css" href="Styles/PurchaseOrders.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h1>Purchase Orders</h1><br />
<asp:AccessDataSource ID="ListPurchaseOrdersSource" runat="server" 
        DataFile="~/App_Data/mrsparklytrent.accdb" 
        SelectCommand="SELECT PurchaseOrders.purchaseOrderID, PurchaseOrders.purchaseOrderNo, PurchaseOrders.purchaseOrderDate, Suppliers.supplierName FROM (PurchaseOrders INNER JOIN Suppliers ON PurchaseOrders.supplierID = Suppliers.supplierID)">
    </asp:AccessDataSource>
    <asp:ListView ID="ListView1" runat="server" 
        DataSourceID="ListPurchaseOrdersSource" DataKeyNames="purchaseOrderID" 
        onselectedindexchanged="ListView1_SelectedIndexChanging">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="PurchaseOrderIDLabel" runat="server" 
                        Text='<%# Eval("purchaseOrderID") %>' />
                </td>
                <td>
                    <asp:Label ID="purchaseOrderNoLabel" runat="server" 
                        Text='<%# Eval("purchaseOrderNo") %>' />
                </td>
                <td>
                    <asp:Label ID="purchaseOrderDateLabel" runat="server" 
                        Text='<%# Eval("purchaseOrderDate") %>' />
                </td>
                <td>
                    <asp:Label ID="supplierNameLabel" runat="server" 
                        Text='<%# Eval("supplierName") %>' />
                </td>
                <td>
                <asp:Button ID="SelectButton" runat="server" CommandName="Select" DataKeyNames="purchaseOrderID"
                        Text="Select" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="purchaseOrderIDLabel1" runat="server" 
                        Text='<%# Eval("purchaseOrderID") %>' />
                </td>
                <td>
                    <asp:TextBox ID="purchaseOrderNoTextBox" runat="server" 
                        Text='<%# Bind("purchaseOrderNo") %>' />
                </td>
                <td>
                    <asp:TextBox ID="purchaseOrderDateTextBox" runat="server" 
                        Text='<%# Bind("purchaseOrderDate") %>' />
                </td>
                <td>
                    <asp:TextBox ID="supplierNameTextBox" runat="server" 
                        Text='<%# Bind("supplierName") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:TextBox ID="purchaseOrderNoTextBox" runat="server" 
                        Text='<%# Bind("purchaseOrderNo") %>' />
                </td>
                <td>
                    <asp:TextBox ID="purchaseOrderDateTextBox" runat="server" 
                        Text='<%# Bind("purchaseOrderDate") %>' />
                </td>
                <td>
                    <asp:TextBox ID="supplierNameTextBox" runat="server" 
                        Text='<%# Bind("supplierName") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="purchaseOrderIDLabel" runat="server" 
                        Text='<%# Eval("purchaseOrderID") %>' />
                </td>
                <td>
                    <asp:Label ID="purchaseOrderNoLabel" runat="server" 
                        Text='<%# Eval("purchaseOrderNo") %>' />
                </td>
                <td>
                    <asp:Label ID="purchaseOrderDateLabel" runat="server" 
                        Text='<%# Eval("purchaseOrderDate") %>' />
                </td>
                <td>
                    <asp:Label ID="supplierNameLabel" runat="server" 
                        Text='<%# Eval("supplierName") %>' />
                </td>
                <td>
                <asp:Button ID="SelectButton" runat="server" CommandName="Select" 
                        Text="Select" />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">
                                    Purchase Order ID</th>
                                <th runat="server">
                                    Order No</th>
                                <th runat="server">
                                    Order Date</th>
                                <th runat="server">
                                    Supplier Name</th>
                                <th runat="server">
                                    Select</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="purchaseOrderIDLabel" runat="server" 
                        Text='<%# Eval("purchaseOrderID") %>' />
                </td>
                <td>
                    <asp:Label ID="purchaseOrderNoLabel" runat="server" 
                        Text='<%# Eval("purchaseOrderNo") %>' />
                </td>
                <td>
                    <asp:Label ID="purchaseOrderDateLabel" runat="server" 
                        Text='<%# Eval("purchaseOrderDate") %>' />
                </td>
                <td>
                    <asp:Label ID="supplierNameLabel" runat="server" 
                        Text='<%# Eval("supplierName") %>' />
                </td>
                <td>
                <asp:Button ID="SelectButton" runat="server" CommandName="Select" DataKeyNames="purchaseOrderID"
                        Text="Select" />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
        <asp:DataPager ID="DataPager1" PagedControlID="ListView1" PageSize="3" runat="server">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                ShowNextPageButton="False" ShowPreviousPageButton="False" />
                <asp:NumericPagerField />
            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                ShowNextPageButton="False" ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>
    <br /><br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
         Height="50px" Width="125px" ondatabound="DetailsView1_Load" CssClass="detailsview">
        <Fields>
            <asp:BoundField DataField="purchaseOrderID" HeaderText="purchaseOrderID" 
                InsertVisible="False" SortExpression="purchaseOrderID" />
            <asp:BoundField DataField="purchaseOrderNo" HeaderText="purchaseOrderNo" 
                SortExpression="purchaseOrderNo" />
            <asp:BoundField DataField="purchaseOrderDate" HeaderText="purchaseOrderDate" 
                SortExpression="purchaseOrderDate" />
            <asp:BoundField DataField="supplierName" HeaderText="supplierName" 
                SortExpression="supplierName" />
            <asp:BoundField DataField="contactName" HeaderText="contactName" 
                SortExpression="contactName" />
            <asp:BoundField DataField="supplierPhone" HeaderText="supplierPhone" 
                SortExpression="supplierPhone" />
            <asp:BoundField DataField="supplierEmail" HeaderText="supplierEmail" 
                SortExpression="supplierEmail" />
            <asp:BoundField DataField="deliveryAddress" HeaderText="deliveryAddress" 
                SortExpression="deliveryAddress" />
        </Fields>
    </asp:DetailsView>

    <asp:GridView ID="GridView1" runat="server" CssClass="detailsview" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="rawMaterialsName" HeaderText="Raw Material" 
                SortExpression="rawMaterialsName" />
            <asp:BoundField DataField="purchaseOrderItemQty" 
                HeaderText="Item Quantity" SortExpression="purchaseOrderItemQty" />
            <asp:BoundField DataField="purchaseOrderItemPrice" 
                HeaderText="Item Price" SortExpression="purchaseOrderItemPrice" />
            <asp:BoundField DataField="purchaseOrderLineSubtotal" 
                HeaderText="Subtotal" 
                SortExpression="purchaseOrderLineSubtotal" />
            <asp:BoundField DataField="purchaseOrderID" HeaderText="purchaseOrderID" 
                InsertVisible="False" SortExpression="purchaseOrderID" Visible="False" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:AccessDataSource ID="PurchaseOrderLinesDataSource" runat="server" 
        DataFile="~/App_Data/mrsparklytrent.accdb" 
        SelectCommand="SELECT RawMaterials.rawMaterialsName, PurchaseOrderLines.purchaseOrderItemQty, PurchaseOrderLines.purchaseOrderItemPrice, PurchaseOrderLines.purchaseOrderLineSubtotal, PurchaseOrders.purchaseOrderID FROM ((PurchaseOrders INNER JOIN PurchaseOrderLines ON PurchaseOrders.purchaseOrderID = PurchaseOrderLines.purchaseOrderID) INNER JOIN RawMaterials ON PurchaseOrderLines.rawMaterialsID = RawMaterials.rawMaterialsID)">
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="PurchaseOrdersSource" runat="server" 
        DataFile="~/App_Data/mrsparklytrent.accdb" 
        SelectCommand="SELECT PurchaseOrders.purchaseOrderID, PurchaseOrders.purchaseOrderNo, PurchaseOrders.purchaseOrderDate, Suppliers.supplierName, Suppliers.contactName, Suppliers.supplierPhone, Suppliers.supplierEmail, PurchaseOrders.deliveryAddress FROM (PurchaseOrders INNER JOIN Suppliers ON PurchaseOrders.supplierID = Suppliers.supplierID)">
    </asp:AccessDataSource>
    </asp:Content>
