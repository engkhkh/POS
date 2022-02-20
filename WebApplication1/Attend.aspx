<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Attend.aspx.cs" Inherits="WebApplication1.Attend" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">
        <telerik:radscriptmanager runat="server" ID="RadScriptManager1" />
    <div>
   
        <br />
        <br />

        <br />
        <br />
        <br />
     
        <telerik:RadGrid runat="server" ID="radgrid1" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True"  enableEventValidation="true" >
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
        </telerik:RadGrid>
        
    </div>
    </form>
</body>
</html>
