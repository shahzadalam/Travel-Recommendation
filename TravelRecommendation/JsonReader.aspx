<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JsonReader.aspx.cs" Inherits="TravelRecommendation.JsonReader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#btn").click(function () {

                var values = ["item1", "item2"];
                $.ajax({
                    type: "POST",
                    url: "JsonReader.aspx/done1", // the method we are calling
                    contentType: "application/json; charset=utf-8",
                    data: "{ ids:"+JSON.stringify( values)+" }",
                    dataType: "json",
                    success: function (result) {
                        alert('Yay! It worked!' + JSON.stringify(result));
                    },
                    error: function (result) {
                        alert('Oh no :(' + JSON.stringify(result));
                    }
                });
            });

        });
        
        // Grab the information 
        
      //  var theIds = JSON.stringify(values);

        // Make the ajax call
       
  </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <input id="btn" type="button" />
    </div>
    </form>
</body>
</html>
