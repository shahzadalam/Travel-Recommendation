<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreData.aspx.cs" Inherits="TravelRecommendation.StoreData" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
       
                <div style="padding-left:30%">
                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="Load" OnClick="Button1_Click" Style="font-size: medium; width: auto" />
                </div>
                <br />
             
            <asp:ListView ID="ListView1" runat="server">
                
            </asp:ListView>  
            
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <img src="img/3.gif" /> 
            </ProgressTemplate>
        </asp:UpdateProgress>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <%--<asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />--%>

            </ContentTemplate>
           
        
        </asp:UpdatePanel>

        </div>
      
    </form>
</body>
</html>
