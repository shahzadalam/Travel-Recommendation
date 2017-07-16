<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Recommend.aspx.cs" Inherits="TravelRecommendation.Recommend" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inetligence Recommendation</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <link href="css/bootstrap.min.css" rel="stylesheet">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link href="css/portfolio-item.css" rel="stylesheet">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDINToPaSV3TDYHj81fupem7NWbWv15fG4"></script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <script>
        
        function dowiki(place) {
            var URL = 'https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=';
      
              URL += "&titles=" + place;
              URL += "&rvprop=content";
              URL += "&callback=?";
            $.getJSON(URL, function (data) {
                var obj = data.query.pages;
                var ob = Object.keys(obj)[0];
                console.log(obj[ob]["extract"]);
                try{
                    document.getElementById('Label11').textContent = obj[ob]["extract"];
                }
                catch (err) {
                    document.getElementById('Label11').textContent = err.message;
                }
               
            });
        }
    </script>
    <script>
        var data;
        function initialize() {
            var center = new google.maps.LatLng(data[0].lat, data[0].lng);

            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 13,
                center: center,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
            var bounds = new google.maps.LatLngBounds();
            var markers = [];
            for (var i = 0; i < data.length; i++) {
                var marker = data[i]

                var latLng = new google.maps.LatLng(marker.lat,
                    marker.lng);
                var marker = new google.maps.Marker({
                    position: latLng
                });
                markers.push(marker);
                bounds.extend(marker.position);
            }
            map.fitBounds(bounds);
            var markerCluster = new MarkerClusterer(map, markers, { imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m' });
        }
        function callCluster(loc) {
            data = loc;
            google.maps.event.addDomListener(window, 'load', initialize);
        }
    </script>
</head>
<body >
    <form id="form1" runat="server">
    
        <!-- Navigation -->
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
                <a class="navbar-brand" href="#"><asp:Label ID="Label1" runat="server" Text="Home"></asp:Label></a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="float:right">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="Home.aspx">Home</a>
                    </li>
                    <li>
                        <a href="Login.aspx">Admin</a>
                    </li>
                    <li>
                        <a href="Userpanel.aspx">Logout</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container col-lg-11" style="background-color: rgba(47, 43, 43, 0.45);margin:-1% 4% 4% 4%">

        <!-- Portfolio Item Heading -->
        <div class="row">
            <div class="col-lg-12" style="color:aqua">
                <h1 class="page-header" style="color:rgb(112, 244, 220)">Our Recommendation
                    <small>For you</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Item Row -->
        <div class="row">

            <div class="col-md-8">
                <div id="map-container" style="height:500px"><div id="map" style="height:100%"></div></div>
            </div>

            <div class="col-md-4">
                <div class="col-lg-12">
            <div class="registrationform">
                <div class="form-horizontal" style="font-size:medium">
                    <fieldset>
                        <legend style="color:rgb(112, 244, 220)">Personalize <i class="fa fa-pencil pull-right"></i></legend>
                         <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Country:" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                
                                <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control ddl" Style="width: inherit" DataSourceID="SqlDataSource1" DataTextField="country" DataValueField="country" AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FlickrDatasetConnectionString %>' SelectCommand="SELECT DISTINCT [country] FROM [PhotoMeta]"></asp:SqlDataSource>
                            </div>
                        </div>

                         <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="City :" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                
                                <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control ddl" Style="width: inherit;" DataSourceID="SqlDataSource2" DataTextField="county" DataValueField="county">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:FlickrDatasetConnectionString %>' SelectCommand="SELECT DISTINCT [county] FROM [PhotoMeta] WHERE ([country] = @country)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList3" PropertyName="SelectedValue" Name="country" Type="String"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label10" runat="server" Text="Gender :" CssClass="col-lg-2 control-label"></asp:Label>
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
                            <asp:Label ID="Label6" runat="server" Text="Age Group:" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                
                                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control ddl" style="width:inherit">
                                    <asp:ListItem>Youth</asp:ListItem>
                                    <asp:ListItem>Family</asp:ListItem>
                                    <asp:ListItem>Teen</asp:ListItem>
                                    <asp:ListItem>Children</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                         <div class="form-group">
                            <asp:Label ID="Label4" runat="server" Text="Race:" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                
                                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control ddl" Style="width: inherit" DataSourceID="SqlDataSource3" DataTextField="race" DataValueField="race">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:FlickrDatasetConnectionString %>' SelectCommand="SELECT DISTINCT [race] FROM [FaceAttribute]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label12" runat="server" Text="Budget:" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="TextBox1" runat="server" placeholder="Please enter in range 50-200" Style="width: inherit" CssClass="form-control"></asp:TextBox>
                             <p>Here budget is index which lie between 50-100.So greater number signifies greater cost.</p>
                            </div>
                        </div>
     
                       
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Recommend Me" OnClick="btnSubmit_Click"  />
                                                            
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
            </div>

        </div>
        <!-- /.row -->

        <!-- Related Projects Row -->
        <div class="row">

            <div class="col-lg-12">
                <h3 class="page-header" style="background-color:white">Top Recommended Places</h3>
            </div>

            <div class="col-sm-3 col-xs-6">
                
                     <asp:Image ID="Image1" runat="server" class="img-responsive portfolio-item"   />
                   <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click"><asp:Label ID="Label5" style="font-size: xx-large;font-family: -webkit-body" runat="server" Text=""></asp:Label></asp:LinkButton>
               
            </div>

            <div class="col-sm-3 col-xs-6">
               
                    <asp:Image ID="Image2" runat="server" class="img-responsive portfolio-item"   />
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ><asp:Label ID="Label7" style="font-size: xx-large;font-family: -webkit-body" runat="server" Text=""></asp:Label></asp:LinkButton>
                    
                
            </div>

            <div class="col-sm-3 col-xs-6">
                
                      <asp:Image ID="Image3" runat="server" class="img-responsive portfolio-item"   />
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click"><asp:Label ID="Label8" style="font-size: xx-large;font-family: -webkit-body" runat="server" Text=""></asp:Label></asp:LinkButton>

              
            </div>

            <div class="col-sm-3 col-xs-6">
                
                      <asp:Image ID="Image4" runat="server" class="img-responsive portfolio-item"  />
                    <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click"><asp:Label ID="Label9" style="font-size: xx-large;font-family: -webkit-body" runat="server" Text=""></asp:Label></asp:LinkButton>

                
            </div>

        </div>
        <hr />
           <div class="col-lg-12" style="background-color:white;color:black">
                    <asp:Label ID="Label11" runat="server" Text="" ></asp:Label>
                </div>

        <hr/>
        <hr />
        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Shahzad 2016</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>

    </form>
     <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.backstretch.js" type="text/javascript"></script>
    <script type="text/javascript">
        'use strict';
        $.backstretch(
        [
            "img/rhome.jpg",
           
        ],

        {
            duration: 4500,
            fade: 1500
        }
    );

    </script>
</body>
</html>
