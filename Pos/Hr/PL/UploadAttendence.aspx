<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadAttendence.aspx.cs" Inherits="Pos.Hr.PL.UploadAttendence" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        

<asp:FileUpload ID="FileUpload1" runat="server" />

<asp:Button ID="btnUpload" runat="server" Text="Upload/تحميل" OnClick="btnUpload_Click" />

<br />

<asp:Label ID="Label1" runat="server" Text="Has Header ?" />

<asp:RadioButtonList ID="rbHDR" runat="server">

    <asp:ListItem Text = "Yes" Value = "Yes" >

    </asp:ListItem>

    <asp:ListItem Text = "No" Value = "No" Selected = "True"  ></asp:ListItem>

</asp:RadioButtonList>

<asp:GridView ID="GridView1" runat="server"

OnPageIndexChanging = "PageIndexChanging" AllowPaging = "true">

</asp:GridView>
        
        <br />
        <br />

        <asp:Button ID="Button1" runat="server" Text="ok,upload it" OnClick="Button1_Click" Visible="false" BackColor="Red" />

        <br />
        <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>


    </div>
    </form>
</body>
</html>
