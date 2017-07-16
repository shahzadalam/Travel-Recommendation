<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JsonParser.aspx.cs" Inherits="TravelRecommendation.JsonParser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title> <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
        function doSearch(id) {
            var key = "b4e9dfa823d28e1ff46c2b6500f81f21";
            var searchURL = "https://api.flickr.com/services/rest/?method=flickr.photos.getInfo";
            searchURL += "&api_key=" + key;
            searchURL += "&photo_id=" + id;
            searchURL += "&format=json";
            searchURL += "&jsoncallback=?";

            $.getJSON(searchURL, setImages);

        }
        function setImages(data) {


            document.getElementById('TextBox2').value = data.photo.location.locality._content;

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server">

        </asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox2" runat="server">

        </asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Next" OnClick="Button1_Click" />
    </div>
        <asp:Label ID="Label1" runat="server" Text="0"></asp:Label>
    </form>
</body>
</html>
