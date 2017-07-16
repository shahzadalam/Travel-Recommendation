<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClusterMap.aspx.cs" Inherits="TravelRecommendation.ClusterMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
    <title>Marker Clustering</title>
    <style >
    
      #map-container {
        padding: 6px;
        border-width: 1px;
        border-style: solid;
        border-color: #ccc #ccc #999 #ccc;
        -webkit-box-shadow: rgba(64, 64, 64, 0.5) 0 2px 5px;
        -moz-box-shadow: rgba(64, 64, 64, 0.5) 0 2px 5px;
        box-shadow: rgba(64, 64, 64, 0.1) 0 2px 5px;
        width:820px;
        
      }
      
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDINToPaSV3TDYHj81fupem7NWbWv15fG4"></script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <script>
        var data;
        var zo;
        function initialize() {
            var center = new google.maps.LatLng(data[0].lat, data[0].lng);

            var map = new google.maps.Map(document.getElementById('map'), { 
                zoom: 10,
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
        function callCluster(loc,zo1) {
            data = loc;
            zo = zo1
            google.maps.event.addDomListener(window, 'load', initialize);
        }
    </script>
    <script>
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-12846745-20']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' === document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation" style="background-color:rgba(0, 0, 0, 0.64)">
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
                    <li><a href="/Userpanel.aspx">Login</a> </li>
                    <li><a href="/Login.aspx">Admin</a> </li>
                    <li><a href="/Test.aspx">Dataset</a> </li>
                </ul>
            </div>
        </div>
    </div>
        <asp:Label ID="Label1" runat="server" Text="Country  :"></asp:Label>
        <asp:DropDownList ID="DropDownList2" class="btn btn-default btn-lg dropdown-toggle" runat="server" DataSourceID="SqlDataSource2" DataTextField="country" DataValueField="country"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FlickrDatasetConnectionString %>" SelectCommand="SELECT DISTINCT [country] FROM [PhotoMeta]"></asp:SqlDataSource>
        <asp:Label ID="Label2" runat="server" Text="City   :"></asp:Label><asp:DropDownList ID="DropDownList1" class="btn btn-default btn-lg dropdown-toggle" runat="server" DataSourceID="SqlDataSource3" DataTextField="county" DataValueField="county"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FlickrDatasetConnectionString %>" SelectCommand="SELECT DISTINCT [county] FROM [PhotoMeta] WHERE ([country] = @country)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="country" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="Show" CssClass="btn btn-group" OnClick="Button1_Click" /><br /><br /><br />
        <div id="map-container" style="float:left"><div id="map" style="width:800px;height:800px" ></div></div>
        <div id="info-container" style="float:left">
            
        <asp:ListBox ID="ListBox1" runat="server" class="list-group-item" style="height:200px">
            <asp:ListItem Enabled="True">Rank of city :</asp:ListItem>
            </asp:ListBox>
            <asp:ListView ID="ListView1" runat="server"></asp:ListView>
        <asp:HiddenField ID="HiddenField1" runat="server" />
    </form>
</body>
</html>
