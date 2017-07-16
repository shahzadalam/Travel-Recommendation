<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TravelRecommendation.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="css/HomePage.css" type="text/css">
     <script>
    function validateForm() {
        var uname = document.forms["LoginForm"]["username"].value;
        var passwd = document.forms["LoginForm"]["password"].value;
        if (uname == null || uname == "" || passwd == null || passwd == "") {
            alert("Username/password cannot left blank");
            return false;
        }
    }
    </script>
</head>
<body class="loginbody" style="background-image:url(Images/login.jpg)">
    <form name="LoginForm" id="form1" runat="server" onsubmit="return validateForm()" >
    <div class="heading">
			<!--        <h1>Welcome To Online Trading System</h1>  -->
		</div>
		<div class="loginspace">
			<h1 style="color: white">Welcome To Travel Recommendation Admin Panel</h1>
			<hr>
			<br> Username: <asp:TextBox class="textbox" ID="TextBox1" style="width: 35%; height: 8%" name="username" runat="server"></asp:TextBox>
            <br>
			<br> <br> Password: <asp:TextBox class="textbox" style="width: 35%; height: 8%" type="password" name="password"   ID="TextBox2" runat="server"></asp:TextBox>
            <br>
			<br> <br> <asp:Button ID="Button1" class="button" style="width: 25%; height: 8%"  runat="server" Text="Submit" OnClick="Button1_Click" />
            

		</div>
    </form>
</body>
</html>
