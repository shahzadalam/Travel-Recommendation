<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPanel.aspx.cs" Inherits="TravelRecommendation.UserPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Coming soon, Bootstrap, Bootstrap 3.0, Free Coming Soon, free coming soon, free template, coming soon template, Html template, html template, html5, Code lab, codelab, codelab coming soon template, bootstrap coming soon template">
    <title>Travel Intelligence</title>
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
      <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Travel Recommendation</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/Home.aspx">Home</a> </li>
                    <li><a href="/ClusterMap.aspx?user=123">Places</a> </li>
                    <li><a href="/Login.aspx">Admin</a> </li>
                    <li><a href="/contact">Contact Us</a> </li>
                </ul>
            </div>
        </div>
    </div>
        <div class="container">
        <!--login --------------form-->
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center" style="background-color: rgba(62, 62, 69, 0.5);">
             <div class="form-bottom" >
                 <legend>Login if already registered<i class=" pull-center" style="align-content:center"></i></legend>
			                   
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                             <asp:TextBox ID="TextBox5" runat="server" placeholder="Email..." class="form-username form-control"></asp:TextBox>
                                      </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	 <asp:TextBox ID="TextBox6" TextMode="Password" runat="server"  placeholder="Password..." class="form-password form-control"></asp:TextBox>
                                    </div>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Sign in!" OnClick="Button1_Click" style="margin-bottom:4%" />
			                        
			                  
		                    </div>
                
        </div>
        <!--login --------------form-->
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Registration Form <i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <asp:Label ID="Label7" runat="server" Text="Name" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TextBox4" runat="server" placeholder="Name" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Email" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TextBox1" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Password" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TextBox2" runat="server" placeholder="Password" CssClass="form-control"
                                    TextMode="Password"></asp:TextBox>
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Remember Me" />
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="Address" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label6" runat="server" Text="Age" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                
                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control ddl" style="width:inherit"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label4" runat="server" Text="Gender" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <div class="radio">
                                    <label>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                            <asp:ListItem Selected="True">Male</asp:ListItem>
                                            <asp:ListItem>Female</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                          <asp:Label ID="Label5" runat="server" Text="Country" CssClass="col-lg-2 control-label"></asp:Label>                          
                            <div class="col-lg-10">
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control ddl">
                                    <asp:ListItem>INDIA</asp:ListItem>
                                    <asp:ListItem>USA</asp:ListItem>
                                    <asp:ListItem>UK</asp:ListItem>
                                    <asp:ListItem>France</asp:ListItem>
                                </asp:DropDownList>                              
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                                  <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" OnClick="btnCancel_Click" />                              
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.backstretch.js" type="text/javascript"></script>
    <script type="text/javascript">
        'use strict';
        $.backstretch(
        [
            "img/paris.jpg",
            "img/venice.jpg",
            "img/evening.jpg",
            "img/city.jpg"
        ],

        {
            duration: 4500,
            fade: 1500
        }
    );
       
    </script>
    </form>
</body>
</html>
