<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Inscription.aspx.cs" Inherits="Projet_AppTrans.Models.Inscription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LoginContent" runat="server">
    <asp:Table ID="Table1" runat="server"></asp:Table>
    <table style="width:100%;">
        <tr>
            <td style="height: 35px">Name:</td>
            <td style="height: 35px"><asp:TextBox ID="name_id" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name_id" ErrorMessage="Name is required" ForeColor="Red" ValidationGroup="check_inscription"></asp:RequiredFieldValidator>
            </td>

        </tr>

        <tr>
            <td>Email: </td>
            <td><asp:TextBox ID="email_id" runat="server" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email is required" ForeColor="Red" ValidationGroup="check_inscription" ControlToValidate="email_id"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email_id" ErrorMessage="Wrong format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="check_inscription"></asp:RegularExpressionValidator>
            </td>
           
        </tr>
        <tr>
            <td>Password: </td>
            <td><asp:TextBox ID="password_id" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Password is required" ControlToValidate="password_id" ForeColor="Red" ValidationGroup="check_inscription"></asp:RequiredFieldValidator>
            </td>
   
        </tr>
    </table>
   <asp:Button ID="btnRegister" runat="server" Text="Submit" OnClick="BtnRegister_Click" ValidationGroup="check_inscription" />
    


    <asp:Label ID="confirmation" runat="server" Text=""></asp:Label>


</asp:Content>

