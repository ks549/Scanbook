<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScanBookHome.aspx.cs" Inherits="WebAppScanBook.ScanBookHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .button {
            background-color: #0094ff;
            color: #FFFFFF;
            float: left;
            padding: 10px;
            border-radius: 10px;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
        }

        .container {
            background-color: #0094ff;
            color: #ffffff;
            font-family: Cooper;
            height: 80px;
        }

        .content {
            background-color: #dadbe0;
            font-family: 'Accord SF';
            height: 170px;
            color: #000000;
        }

        .content1 {
            background-color: #dadbe0;
            font-family: 'Accord SF';
            height: 500px;
            color: #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
            <div class="container">
                <h1>SCANBOOK</h1>
            </div>
            <br />
            <div class="content">
                <b>ISBN search:</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="TextBox1" runat="server" Width="213px"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="Button1" Class="button" runat="server" Text="Go" OnClick="Button1_Click" />
                <br />
            </div>
            <div class="content">
                <h3><asp:Label ID="Label1" runat="server"></asp:Label></h3>
                <asp:Label ID="Label2" runat="server"></asp:Label>
                <br />
                <asp:Label ID="Label3" runat="server"></asp:Label>
                <br />
                <asp:Label ID="Label4" runat="server"></asp:Label>
                <br />
                <asp:Label ID="Label5" runat="server"></asp:Label>
                <br />
                <asp:Label ID="Label6" runat="server" ForeColor="#FF6666"></asp:Label>
            </div>
            <hr />
            <div class="content1">
                <asp:Label ID="Label7" runat="server"></asp:Label>
                <br />
                <asp:Label ID="Label8" runat="server"></asp:Label>
                <br />
                <asp:TextBox ID="TextBox2" runat="server" Height="32px" Visible="False" Width="367px" TextMode="MultiLine"></asp:TextBox>
                <br />
                <asp:Button ID="Button2" runat="server" class="button" OnClick="Button2_Click" Text="Post" Visible="False" />
            </div>
    </form>
</body>
</html>

