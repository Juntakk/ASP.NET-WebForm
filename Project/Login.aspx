<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Projet_AppTrans.Models.Login" %>




<asp:Content ID="Content1" ContentPlaceHolderID="LoginContent" runat="server">

    

    <asp:Label ID="loginResult_id" runat="server" Font-Bold="True"></asp:Label>

    <table class="login-table" >
        <tr>
            <td>Email:</td>
            <td><asp:TextBox ID="email_id" runat="server" TextMode="Email" ValidationGroup="check_inscription"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is required" ForeColor="Red" ValidationGroup="check_inscription" ControlToValidate="email_id"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email_id" ErrorMessage="Wrong format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="check_inscription"></asp:RegularExpressionValidator>
</td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><asp:TextBox ID="password_id" runat="server" ValidationGroup="check_inscription"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password is required" ControlToValidate="password_id" ForeColor="Red" ValidationGroup="check_inscription"></asp:RequiredFieldValidator>
</td>
        </tr>
       
    </table>
    <asp:Button ID="connection" runat="server" Text="Login" OnClick="Connection_Click" ValidationGroup="check_inscription" />


    
</asp:Content>

