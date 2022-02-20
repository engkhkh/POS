<%@ Page Title="" Language="C#" MasterPageFile="../PL/SalesLayout.master" AutoEventWireup="true" Codefile="ProductsInventory.aspx.cs" Inherits="Pos.PL.ProductsInventory" %>

<%@ Register Src="~/PL/ProductsInventoryUserControl.ascx" TagPrefix="uc1" TagName="ProductsInventoryUserControl" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <uc1:ProductsInventoryUserControl runat="server" id="ProductsInventoryUserControl" />

</asp:Content>
