<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoaderDemo.aspx.cs" Inherits="TravelRecommendation.LoaderDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
            <ProgressTemplate>
                <img src="img/3.gif" /> 
            </ProgressTemplate>
        </asp:UpdateProgress>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />

            </ContentTemplate>
           
        
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
