<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FetchData.aspx.cs" Inherits="TravelRecommendation.FetchData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
<div>
    <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
    <br />
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    <br />
    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="photoID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="photoID" HeaderText="photoID" ReadOnly="True" SortExpression="photoID" />
            <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FlickrDatasetConnectionString %>" SelectCommand="SELECT [photoID], [country] FROM [Flickrdata]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
