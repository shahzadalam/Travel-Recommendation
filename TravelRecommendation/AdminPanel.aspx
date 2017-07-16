<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="TravelRecommendation.AdminPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
        function doSearch(id) {
            
            document.getElementById("file").style.display = 'none';
            var key = "b4e9dfa823d28e1ff46c2b6500f81f21";
            var searchURL = "https://api.flickr.com/services/rest/?method=flickr.photos.getInfo";
            searchURL += "&api_key=" + key;
            searchURL += "&photo_id=" + id;
            searchURL += "&format=json";
            searchURL += "&jsoncallback=?";

            $.getJSON(searchURL, setImages);

        }
        function setImages(data) {

            //$('iframe1').prop('src', document.getElementById('TextBox3').value);
            document.getElementById('TextBox4').value = data.photo.location.latitude;
            document.getElementById('TextBox5').value = data.photo.location.longitude;
            try{
                document.getElementById('TextBox9').value = data.photo.location.county._content;
            } catch (err) {
                document.getElementById('TextBox9').value = data.photo.location.region._content;
            }
            document.getElementById('TextBox10').value = data.photo.location.region._content;
            document.getElementById('TextBox11').value = data.photo.location.country._content;
            //document.getElementById('TextBox12').value = data.photo.comments._content;
            document.getElementById('TextBox8').value = data.photo.location.locality._content;
            document.getElementById('TextBox7').value = data.photo.location.neighbourhood._content;



        }
        function getFace(url) {
            document.getElementById("file").style.display = 'none';
            var key = "148105bc8d66b2b40284bdd98bb727b1";
            var secret = "ot4RYTdr1wu9eX2CnwcSAMwcGh2j94RQ";
            var searchURL = "https://apius.faceplusplus.com/v2/detection/detect?";
            searchURL += "&url=" + url;
            searchURL += "&api_secret=" + secret;
            searchURL += "&api_key=" + key;
            searchURL += "&attribute=gender,age,race";
            //searchURL += "&format=json";
            //searchURL += "&jsoncallback=?";

            $.getJSON(searchURL, getFaceAttributes);

        }
        function getFaceAttributes(data) {
            //document.getElementById('TextBox13').value = data.face[0].attribute.gender.value;
            // document.getElementById('faceNum').style.visibility = 'visible';
            $('#jsonDataHolder').val(JSON.stringify(data));
            if (data.face.length != null) {
                document.getElementById('faceNum').style.visibility = 'visible';
                document.getElementById('TextBox13').value = data.face.length;
                
                document.getElementById('table').style.visibility = 'visible';
                for (var i = 0; i < data.face.length; i++) {
                    var table = document.getElementById('table');
                    var row = table.insertRow(i + 1);
                    var cell1 = row.insertCell(0);
                    var cell2 = row.insertCell(1);
                    var cell3 = row.insertCell(2);
                    var cell4 = row.insertCell(3);
                    cell1.innerHTML = i + 1;
                    cell2.innerHTML = data.face[i].attribute.race.value;
                    cell3.innerHTML = data.face[i].attribute.gender.value;
                    cell4.innerHTML = data.face[i].attribute.age.value;

                }
            } else {
                alert("Image size is large");
            }
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
                    <li><a href="/UserPanel.aspx">Home</a> </li>
                    <li><a href="/ClusterMap.aspx?user=123">Places</a> </li>
                    <li><a href="/Login.aspx">Admin</a> </li>
                    <li><a href="/UserPanel.aspx">Login</a> </li>
                </ul>
            </div>
        </div>
    </div>
        <div class="container-fluid">
           
            <div id="file" class="form-group">
                <label for="exampleInputEmail1">File input</label><asp:FileUpload ID="FileUpload1" runat="server" />
                <p class="help-block">Choose file from above button.</p>
            </div>
            <div>
                <div style="padding-left:30%">
                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Load" OnClick="Button1_Click" Style="font-size: medium; width: auto" />
                    &nbsp<asp:Button ID="Button2" class="btn btn-primary" runat="server" Text="Submit" OnClick="Button2_Click" />
                    &nbsp<asp:Button ID="Button3" runat="server" class="btn btn-info" Text="Detect Face" OnClick="Button3_Click" /><br />
                    
               
                </div>
                <br />
                <div class="well-sm" style="width: 40%; float: left">
                    <table class="table table-bordered table-striped" style="tab-size: 4">
                        <tr>
                            <td>
                                <label for="exampleInputName2">Photo ID</label></td>
                            <td>
                                <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="exampleInputName2">Views</label></td>
                            <td>
                                <asp:TextBox ID="TextBox2" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="exampleInputName2">URL</label></td>
                            <td>
                                <asp:TextBox ID="TextBox3" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="exampleInputName2">Latitude</label></td>
                            <td>
                                <asp:TextBox ID="TextBox4" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="exampleInputName2">Longitude</label></td>
                            <td>
                                <asp:TextBox ID="TextBox5" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="exampleInputName2">Neighbourhood </label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox7" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="exampleInputName2">Locality </label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox8" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="exampleInputName2">county</label></td>
                            <td>
                                <asp:TextBox ID="TextBox9" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="exampleInputName2">Region </label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox10" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="exampleInputName2">Country </label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBox11" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <label for="exampleInputName2">Date Taken</label></td>
                            <td>
                                <asp:TextBox ID="TextBox12" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr id="faceNum" style="visibility:hidden">
                            <td>
                                <label for="exampleInputName2">Total Face Detected</label></td>
                            <td>
                                <asp:TextBox ID="TextBox13" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>

                    </table>
               <table id="table" class="table table-bordered table-striped" style="width: auto;visibility:hidden" runat="server">
                <tr>
                    <th>&nbsp; Person No.</th>
                    <th>&nbsp; Race</th>
                    <th>&nbsp;Gender</th>
                    <th>&nbsp;Age</th>
                    
                </tr>
            </table>

                </div>
                <div style="float: right; max-width: 60%; max-height: 50%; padding-right: 50px">
                    <asp:Image ID="Image1" runat="server" class="img-responsive center-block" />

                </div>
                
            </div>

        </div>
        <asp:Label ID="Label1" runat="server" Text="-1" Visible="false"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="" Visible="false"></asp:Label>
         <asp:HiddenField ID="jsonDataHolder" ClientIDMode="Static" runat="server"/>
        <asp:HiddenField ID="HiddenField1" runat="server" />
    </form>
</body>
</html>
