<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="TravelRecommendation.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
  
<title>Dataset marker</title>
<style type="text/css">
html { height: 100% }
body { height: 100%; margin: 0; padding: 0 }
#map_canvas { height: 100% }
</style>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
<script type="text/javascript" src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyBhuqkjk1BfN5dAc3wr299VJshXCtGTQAg">
</script>
<script type="text/javascript">
    function initialize(loc) {
        //alert(loc);
        var markers = loc;
        var mapOptions = {
            center: new google.maps.LatLng(markers[0].lat, markers[0].lng),
            zoom: 14,
            mapTypeId: google.maps.MapTypeId.ROADMAP
            //  marker:true
        };
        var infoWindow = new google.maps.InfoWindow();
        var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
        var bounds = new google.maps.LatLngBounds();
        for (i = 0; i < markers.length; i++) {
            var data = markers[i]
            var myLatlng = new google.maps.LatLng(data.lat, data.lng);
            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: data.title
            });
            (function (marker, data) {

                // Attaching a click event to the current marker
                google.maps.event.addListener(marker, "click", function (e) {
                    infoWindow.setContent(data.description);
                    infoWindow.open(map, marker);
                });
            })(marker, data);
            bounds.extend(marker.position);

        }
        map.fitBounds(bounds);
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
         <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation" style="background-color: rgba(16, 15, 15, 0.29);">
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
                    <li><a href="/UserPanel.aspx">Login</a> </li>
                </ul>
            </div>
        </div>
    </div>
    <div id="map_canvas" style="height:800px;width:auto;margin-top:-5%">
    </div>
    
    </form>
</body>
</html>
