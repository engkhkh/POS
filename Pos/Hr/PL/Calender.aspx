<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calender.aspx.cs" Inherits="Pos.Hr.PL.Calender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div>
    <table>
        <tr>
            <td>
                Company:</td>
            <td>
                <asp:DropDownList ID="ddlcompch"  runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged">
                    <asp:ListItem Text="select company" Value="00"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                 
            </td>
            <td>
                 Not Working Days

            </td>
            
            <td>
                  <asp:CheckBoxList ID="CheckboxList1"  runat="server" AutoPostBack="false" Width="450px" Enabled="False">   
            </asp:CheckBoxList>
            <asp:Label ID="lblmsg" class="textcls" runat="server"></asp:Label> 
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Shift:

            </td>
            <td>
                 <asp:DropDownList ID="DropDownList1"  runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Text="select Shift" Value="00"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>

                <asp:Button ID="Button1" runat="server" class="btn btn-secondary" OnClick="Button1_Click" Text="Del/حذف" />

            </td>
        </tr>
        <tr>
            <td>
                StartDate:
            </td>
            <td>
                <asp:TextBox ID="txtStartDate" class="datepicker" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                EndDate:
            </td>
            <td>
                <asp:TextBox ID="txtEndDate" class="datepicker" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Narriation</td>
            <td>
                <asp:TextBox ID="TextBox1" ReadOnly="true" runat="server" TextMode="MultiLine"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>
                <asp:Button Text="Generate Calendar" class="btn btn-primary" OnClick="GenerateCalendar"
                    runat="server" />
            </td>
            <td>
              
            </td>
            <td>
                
            </td>
            

        </tr>
    </table>
    <br />
    <asp:GridView ID="gvCalendarData" runat="server" />
    <br />
</div>
<div>
    <script src="Scripts/jquery-1.12.4.js"></script>
    <link href="Styles/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-ui.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Styles/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script type="text/javascript">
        $(function () {
            $('.datepicker').datepicker();
        });
    </script>
</div>
    </div>
    </form>
</body>
</html>
