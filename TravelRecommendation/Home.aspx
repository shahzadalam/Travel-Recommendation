<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TravelRecommendation.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/landing-page.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
</head>
<body>
    <form id="form1" runat="server">
       <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color: #75787a">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><asp:Label ID="Label1" runat="server" Text="Intelligence Travel Recommendation"></asp:Label></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="float:right">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="Userpanel.aspx">Home</a>
                    </li>
                    <li>
                        <a href="Login.aspx">Admin</a>
                    </li>
                    <li>
                        <a href="Userpanel.aspx">Login</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
        <a name="about"></a>
    <div class="intro-header">
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-message">
                        <h1 style="color:white">Intelligence Travel Recommendation</h1>
                        <h3 style="color:white">Recommendation based on Community-Contributed Photos</h3>
                        <hr class="intro-divider">
                        <ul class="list-inline intro-social-buttons">
                            <li>
                                <a href="UserPanel.aspx" class="btn btn-default btn-lg"> <span class="network-name" style="color:black">User Login</span></a>
                            </li>
                            <li>
                                <a href="Login.aspx" class="btn btn-default btn-lg"> <span class="network-name" style="color:black">Admin</span></a>
                            </li>
                            <li>
                                <a href="ClusterMap.aspx" class="btn btn-default btn-lg"> <span class="network-name" style="color:black">City Based</span></a>
                            </li>
                            <li>
                                <a href="Test.aspx" class="btn btn-default btn-lg"> <span class="network-name" style="color:black">Dataset</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
        <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li>
                        <a href="Userpanel.aspx">Register</a>
                    </li>
                    <li>
                        <a href="Login.aspx">Admin</a>
                    </li>
                    <li>
                        <a href="Userpanel.aspx">User Login</a>
                    </li>
                    </ul>
                    <p class="copyright text-muted small">Copyright &copy; Shahzad @2016. All Rights Reserved</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    </form>
</body>
</html>
