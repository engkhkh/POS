<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Times.aspx.cs" Inherits="Pos.Hr.PL.Times" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
<script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
<link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
<link href="Styles/calendar-blue.css" rel="stylesheet" type="text/css" />
<script type = "text/javascript">
    $(document).ready(function () {
        $(".Calender").dynDateTime({
            showsTime: true,
            ifFormat: " %H:%M",
            daFormat: "%l;%M %p, %e %m,  %Y",
            align: "BR",
            electric: false,
            singleClick: false,
            displayArea: ".siblings('.dtcDisplayArea')",
            button: ".next()"
        });
    });
</script>
    <%-- %Y/%m/%d %H:%M --%>
    <style type="text/css">
table{border-collapse:collapse;
    margin-right: 42px;
}*,::after,::before{box-sizing:inherit}*,::after,::before{text-shadow:none!important;box-shadow:none!important}
tbody tr td {
  font-family: 'Roboto', sans-serif;
  color: #868e96;
}
button,select{text-transform:none}button,input,optgroup,select,textarea{margin:0;font-family:inherit;font-size:inherit;line-height:inherit}[role=button],a,area,button,input,label,select,summary,textarea{-ms-touch-action:manipulation;touch-action:manipulation}button,input{overflow:visible}
p {
  font-family: 'Roboto', sans-serif;
  color: #868e96;
}
p{margin-top:0;margin-bottom:1rem}h2,h3,p{orphans:3;widows:3}[type=reset],[type=submit],button,html [type=button]{-webkit-appearance:button}</style>
</head>
<body>
    <form id="form1" runat="server">
    
        <table align="center" cellspacing="4"  dir="rtl">
        <tr style="page-break-inside: avoid">
            <td class="auto-style1">
                <asp:Label ID="Label1" runat="server" Text="الفرع /Company" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:DropDownList ID="ddlcompch" runat="server"  AppendDataBoundItems="true" DataTextField="cCompName" DataValueField="cCompany" AutoPostBack="True" OnSelectedIndexChanged="ddlcompch_SelectedIndexChanged"   >
                    <asp:ListItem Text="- Select a branche -تحديد الفرع" Selected="False" />
                </asp:DropDownList>
            </td>
            <td class="auto-style1"></td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td class="auto-style1">
                <asp:Label ID="Label12" runat="server" Text="الشيفت /Shift" ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:DropDownList ID="ddlcompch0" runat="server"  AppendDataBoundItems="true" DataTextField="cCompName" DataValueField="cCompany" AutoPostBack="True" OnSelectedIndexChanged="ddlcompch0_SelectedIndexChanged"   >
                    <asp:ListItem Text="- Select -تحديد " Selected="False" />
                </asp:DropDownList>
            </td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
        
        <tr style="page-break-inside: avoid">
            <td class="auto-style1">
                <asp:Label ID="Label11" runat="server" Text="بصمة الحضور الاولي  /TimeFirstEntryFingerprint " ForeColor="Red"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:TextBox ID="TextBox1" autocomplete="off" runat="server" class="Calender" ></asp:TextBox>
                <img src="../../Images/calender.png" />
                
            </td>
            <td class="auto-style1" style="color: #000000">طبقا لاول يوم في الشيفت</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                <asp:Label ID="Label3" runat="server" Text="بصمة الراحة  /TimeSecondEntryFingerprint" ForeColor="Red"></asp:Label>
            </td>
            <td>
               <asp:TextBox ID="TextBox2" autocomplete="off"  runat="server" class="Calender" ></asp:TextBox>
                <img src="../../Images/calender.png" />
            </td>
            <td>طبقا لاول يوم في الشيفت</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                <asp:Label ID="Label13" runat="server" Text="بصمة انتهاء الراحة  /cTimeFirstExitFingerorint" ForeColor="Red"></asp:Label>
            </td>
            <td>
               <asp:TextBox ID="TextBox3" autocomplete="off"  runat="server" class="Calender" ></asp:TextBox>
                <img src="../../Images/calender.png" /></td>
            <td>طبقا لاول يوم في الشيفت</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                <asp:Label ID="Label14" runat="server" Text="بصمة انتهاءالدوام  /cTimeFirstExitFingerorint" ForeColor="Red"></asp:Label>
            </td>
            <td>
               <asp:TextBox ID="TextBox4" autocomplete="off" runat="server" class="Calender" ></asp:TextBox>
                <img src="../../Images/calender.png" /></td>
            <td>طبقا لاول يوم في الشيفت</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                <asp:Label ID="Label15" runat="server" Text="بصمة بداية الوقت الاضافي   /cOverTimePeriod" ForeColor="Red"></asp:Label>
            </td>
            <td>
               <asp:TextBox ID="TextBox5" autocomplete="off" runat="server" class="Calender" ></asp:TextBox>
                <img src="../../Images/calender.png" /></td>
            <td>طبقا لاول يوم في الشيفت</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                <asp:Label ID="Label9" runat="server" ForeColor="Lime"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="تسجيل البيانات/Save" OnClick="Button1_Click"  />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr style="page-break-inside: avoid">
            <td>
                <asp:Label ID="Label10" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>






    </form>
</body>
</html>
