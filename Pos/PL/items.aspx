<%@ Page Title="" Language="C#" MasterPageFile="../PL/SalesLayout.master" AutoEventWireup="true" Codefile="items.aspx.cs" Inherits="Pos.PL.items" %>

<%@ Register Src="~/PL/Itemusercontrol.ascx" TagPrefix="uc1" TagName="Itemusercontrol" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <uc1:Itemusercontrol runat="server" ID="Itemusercontrol" />



</asp:Content>
