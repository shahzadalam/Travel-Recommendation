<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImsgeDownload.aspx.cs" Inherits="TravelRecommendation.ImsgeDownload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="country" DataValueField="country"></asp:DropDownList><asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FlickrDatasetConnectionString %>' SelectCommand="SELECT DISTINCT [country] FROM [PhotoMeta]"></asp:SqlDataSource>
        <br />
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="county" DataValueField="county"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:FlickrDatasetConnectionString %>' SelectCommand="SELECT DISTINCT [county] FROM [PhotoMeta] WHERE ([country] = @country)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="country" Type="String"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
