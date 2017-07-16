<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateFlickrData.aspx.cs" Inherits="TravelRecommendation.CreateFlickrData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title> 
      <script type="text/javascript">
       function loadFile() {
           var input, file, fr;

           if (typeof window.FileReader !== 'function') {
               alert("The file API isn't supported on this browser yet.");
               return;
           }

           input = document.getElementById('fileinput');
           if (!input) {
               alert("Um, couldn't find the fileinput element.");
           }
           else if (!input.files) {
               alert("This browser doesn't seem to support the `files` property of file inputs.");
           }
           else if (!input.files[0]) {
               alert("Please select a file before clicking 'Load'");
           }
           else {
               file = input.files[0];
               fr = new FileReader();
               fr.onload = receivedText;
               fr.readAsText(file);
           }

           function receivedText(e) {
               lines = e.target.result;
               var newArr = JSON.parse(lines);
            
               document.getElementById("TextBox1").value = newArr.photos.photo[2].id;
               document.getElementById("TextBox2").value = newArr.photos.photo[2].latitude;
               document.getElementById("TextBox3").value = newArr.photos.photo[2].longitude;
               document.getElementById("TextBox4").value = newArr.photos.photo[2].views;
               document.getElementById("TextBox5").value = newArr.photos.photo[2].url_o;
               document.getElementById("TextBox6").value = newArr.photos.photo[2].woeid;
               
           }
       }
</script>
</head>
<body>
<script>
    function jsonFlickrApi(rsp) {
        window.rsp = rsp;
        alert(rsp.photos.photo[1].id);
    }

    </script>
     <script src="https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=b4e9dfa823d28e1ff46c2b6500f81f21&tags=flower&per_page=50&format=json"></script>
 
<form id="jsonFile" name="jsonFile" enctype="multipart/form-data" method="post" runat="server">
    
   <fieldset>
    <h2>Json File</h2>
     <input type='file' id='fileinput'>
     <input type='button' id='btnLoad' value='Load' onclick='loadFile();'>
  </fieldset>

    <asp:Label ID="Label1" runat="server" Text="PhotoID"></asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Latitude"></asp:Label><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <br />
   <asp:Label ID="Label3" runat="server" Text="Longitude"></asp:Label><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <br />
   <asp:Label ID="Label4" runat="server" Text="Views"></asp:Label><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <br />
   <asp:Label ID="Label5" runat="server" Text="URL"></asp:Label><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    <br />
   <asp:Label ID="Label6" runat="server" Text="StreetID"></asp:Label><asp:TextBox ID="TextBox6" runat="server" OnTextChanged="TextBox6_TextChanged" ></asp:TextBox>
    <br />
    <asp:Image ID="Image1" runat="server" EnableViewState="False"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" Text="Load Image" OnClick="Button1_Click" />
    </form>


</body>
</html>

