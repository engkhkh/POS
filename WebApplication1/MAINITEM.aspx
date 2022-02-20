<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MAINITEM.aspx.cs" Inherits="WebApplication1.MAINITEM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <%-- Added for Using Telerik Controls --%>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<link href="Styles.css" rel="stylesheet" />
<head runat="server">
    <title></title>
</head>
<body>
   
      <form id="form1" runat="server">
          <telerik:radscriptmanager runat="server" ID="RadScriptManager1" />
          
 
    <div class="demo-container no-bg">
        <div class="order-conf">
            <ul>
                <li>
                    <telerik:radcombobox RenderMode="Lightweight" ID="RadComboBoxProduct" runat="server" Height="140" Width="315" 
                        DropDownWidth="500" EmptyMessage="Choose a Project" HighlightTemplatedItems="true"  
                        EnableLoadOnDemand="true" Filter="Contains" MarkFirstMatch="true" 
                        Label="Project: " Skin="Office2010Silver"  AutoPostBack="True"  OnSelectedIndexChanged="RadComboBoxProduct_SelectedIndexChanged" OnItemsRequested="RadComboBoxProduct_ItemsRequested">
                        <HeaderTemplate>
                            <table  cellspacing="0" cellpadding="0">
                                <tr>
                                   
                                    <td style="width: 100px;">
                                        Project code
                                    </td>
                                    <td style="width: 100px;">
                                        Project name
                                    </td>
                                    <td style="width: 100px;">
                                        Project description
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table cellspacing="0" cellpadding="0">
                                <tr>
                                    
                                    <td style="width: 100px;">
                                        <%# DataBinder.Eval(Container.DataItem, "cPrj")%>
                                    </td>
                                    <td style="width: 100px;">
                                        <%# DataBinder.Eval(Container.DataItem, "cPrjName")%>
                                    </td>
                                    <td style="width: 100px;">
                                        <%# DataBinder.Eval(Container.DataItem, "cDesc")%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:radcombobox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="RadComboBoxProduct"
                        Display="Dynamic" ErrorMessage="!" CssClass="validator">
                    </asp:RequiredFieldValidator>
                </li>
                <li>
                    <telerik:radcombobox RenderMode="Lightweight" ID="RadComboBoxsubproject" runat="server" Height="140" Width="315" 
                        DropDownWidth="500" EmptyMessage="Choose a sub" HighlightTemplatedItems="true" 
                        EnableLoadOnDemand="true" Filter="Contains" MarkFirstMatch="true"
                        Label="sub Project: " Skin="Office2010Silver"  AutoPostBack="True" OnItemsRequested="RadComboBoxsubproject_ItemsRequested" OnSelectedIndexChanged="RadComboBoxsubproject_SelectedIndexChanged" >
                        <HeaderTemplate>
                            <table  cellspacing="0" cellpadding="0">
                                <tr>
                                   
                                    <td style="width: 100px;">
                                       sub Project code
                                    </td>
                                    <td style="width: 100px;">
                                       sub Project name
                                    </td>
                                    
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table  cellspacing="0" cellpadding="0">
                                <tr>
                                    
                                    <td style="width: 100px;">
                                        <%# DataBinder.Eval(Container.DataItem, "cSubPrj")%>
                                    </td>
                                    <td style="width: 100px;">
                                        <%# DataBinder.Eval(Container.DataItem, "cSubPrjDesc")%>
                                    </td>
                                    
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:radcombobox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="RadComboBoxsubproject"
                        Display="Dynamic" ErrorMessage="!" CssClass="validator" />
                </li>
                <telerik:radcombobox RenderMode="Lightweight" ID="RadComboBoxmain" runat="server" Height="200" Width="1400" 
                        DropDownWidth="1400" EmptyMessage="Choose a mainitem" HighlightTemplatedItems="true" 
                        EnableLoadOnDemand="true" Filter="Contains" MarkFirstMatch="true"
                        Label="mainitem: " Skin="Office2010Silver"  AutoPostBack="True" OnItemsRequested="RadComboBoxmain_ItemsRequested" OnSelectedIndexChanged="RadComboBoxmain_SelectedIndexChanged" >
                        <HeaderTemplate>
                            <table  cellspacing="0" cellpadding="0">
                                <tr>
                                   
                                    <td style="width: 100px;">
                                      Code 
                                    </td>
                                    <td style="width: 700px;">
                                      Name 
                                    </td>
                                    <td style="width: 100px;">
                                     Ref 
                                    </td>
                                     <td style="width: 100px;">
                                     dQty
                                    </td>
                                    <td style="width: 100px;">
                                     dRate
                                    </td>
                                    <td style="width: 100px;">
                                     dValue
                                    </td>
                                    <td style="width: 100px;">
                                     dDiscPer
                                    </td>
                                    <td style="width: 100px;">
                                      Type 
                                    </td
                                    
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table  cellspacing="0" cellpadding="0">
                                <tr>
                                    
                                    <td style="width: 100px;">
                                        <%# DataBinder.Eval(Container.DataItem, "cMItem")%>
                                    
                                    </td>
                                    <td style="width: 700px;">
                                        <%# DataBinder.Eval(Container.DataItem, "cDesc")%>
                                    
                                    </td>
                                    <td style="width: 100px;">
                                        <%# DataBinder.Eval(Container.DataItem, "cRef")%>
                                      
                                    </td>
                                    <td style="width: 100px;">
                                        <%# DataBinder.Eval(Container.DataItem, "dQty")%>
                                      
                                    </td>
                                    <td style="width: 100px;">
                                        <%# DataBinder.Eval(Container.DataItem, "dRate")%>
                                      
                                    </td>
                                    <td style="width: 100px;">
                                        <%# DataBinder.Eval(Container.DataItem, "dValue")%>
                                      
                                    </td>
                                    <td style="width: 100px;">
                                        <%# DataBinder.Eval(Container.DataItem, "dDiscPer")%>
                                      
                                    </td>


                                    <td style="width: 100px;">
                                        <%# DataBinder.Eval(Container.DataItem, " cCompTypeDesc")%>
                                       
                                    </td>
                                   
                                    
                                </tr>
                            </table>
                        </ItemTemplate>
                    </telerik:radcombobox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="RadComboBoxmain"
                        Display="Dynamic" ErrorMessage="!" CssClass="validator" />
                </li>
               
               
               
            </ul>
            <p class="buttons">
                 
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Show Budgt ,Cost ,Boq" Width="166px" />
                 
                <asp:Button ID="CheckoutButton" runat="server" Text="BOQ With Receipt"
                    OnClick="CheckoutButton_Click" />
                 
            </p>
        <asp:Label ID="Label1" runat="server" Enabled="False"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        </div>
    </div>
          <br />
          <div>


              <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" Skin="Telerik" Height="62px" Width="201px" AllowPaging="True" AllowSorting="True">
                
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                
              </telerik:RadGrid>


          </div>
    </form>
</body>
</html>
