<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" Codefile="Login.aspx.cs" Inherits="Pos.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="StyleSheet1.css" rel="stylesheet" />
     <div class="page-header">
                                <div class="page-title">
                                    <h1>Welcome <span>..</span></h1>
                                </div>
                            </div>
  <div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
     <!-- <img src="" id="icon" alt="User Access" />-->
        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Selected="False" Text=".." Value="00"></asp:ListItem>
            <asp:ListItem Selected="False" Text="Sales" Value="Sales"></asp:ListItem>
            <asp:ListItem Selected="False" Text="HR" Value="HR"></asp:ListItem>
            <asp:ListItem Selected="False" Text="Finance" Value="Finance"></asp:ListItem>
            <asp:ListItem Selected="False" Text="WorkFlow" Value="WorkFlow"></asp:ListItem>
        </asp:DropDownList>
    </div>

    <!-- Login Form -->
  
    <div class="fadeIn second">   <asp:TextBox ID="TextBox1"  name="login" placeholder="login" TextMode="password"  runat="server"></asp:TextBox>
      </div> 
        <!--    <input type="text" id="login" class="fadeIn second" name="login" placeholder="login" />-->
      <div class="fadeIn third">  <asp:TextBox ID="TextBox2" class="fadeIn third" name="login" placeholder="password" type="password" runat="server"></asp:TextBox>
    
          </div> 
           <!--     <input type="text" id="password" class="fadeIn third" name="login" placeholder="password" />-->
      <!--  <input type="submit" class="fadeIn fourth" value="Log In" OnClick="Button1_Click1" />-->
    <div class="fadeIn fourth">   <asp:Button ID="Button1" Text="login" runat="server" class="fadeIn fourth" value="Log In" OnClick="Button1_Click1" />
      </div> 
     

    <!-- Remind Passowrd <div id="formFooter">
      <a class="underlineHover" href="#">Forgot Password?</a>
    </div> -->
    

  </div>
</div>




</asp:Content>
