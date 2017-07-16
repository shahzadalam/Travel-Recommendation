<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FaceApi.aspx.cs" Inherits="TravelRecommendation.FaceApi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <title></title>
    <style>
      
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
      
        function getReport() {
            var loc = document.getElementById('TextBox1').value;
            var key = "ee537170702976d9802cedd6fe7d06b1";
            var callLink = "http://api.openweathermap.org/data/2.5/weather?";
            callLink += "&q=" + loc;
            callLink += "&appid=" + key;



            $.getJSON(callLink, getFaceAttributes);

        }
        function getFaceAttributes(data) {
            $('#jsonDataHolder').val(JSON.stringify(data));

            document.getElementById('TextBox1').value = data.main[0].temp;



        }


        

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="loader" id="loader_img">
            
        </div>
        <div id="myDiv">
           <label>Total no. of face detected :</label> <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <div id="table1" class="table">
            <table id="table" class="table table-bordered table-striped" style="width: auto;visibility:hidden" runat="server">
                <tr>
                    <th>&nbsp; Person No.</th>
                    <th>&nbsp; Race</th>
                    <th>&nbsp;Gender</th>
                    <th>&nbsp;Age</th>
                    
                </tr>
            </table>
                <asp:Image ID="Image1" runat="server" ImageUrl="http://www.doyoumovement.com/images/jacqueline_banner.jpg"/>
                </div>
            
            <asp:HiddenField ID="jsonDataHolder" ClientIDMode="Static" runat="server"/>
      </div>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <input id="Button2" type="button" value="Detect Face" onclick="getFace();" /><asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </form>
</body>
</html>
