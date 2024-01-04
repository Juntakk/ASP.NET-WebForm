<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="Projet_AppTrans.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <label>
        Category name :  
    </label>
    <asp:TextBox ID="categoryName" runat="server"></asp:TextBox>
    <asp:Button ID="btnAddCategory" runat="server" OnClick="AddCategory_click" Text="Button" />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="500px">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ButtonType="Button" EditText="Edit" DeleteText="Delete"> 
                       </asp:CommandField>
        </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjetConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ProjetConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [Category]"

    UpdateCommand="UPDATE Category SET name = @name  WHERE ID = @ID"
 DeleteCommand="DELETE FROM Category WHERE ID = @ID">

<UpdateParameters>
    <asp:Parameter Name="name" Type="String" />
</UpdateParameters>

<DeleteParameters>
    <asp:Parameter Name="name" Type="String" />
</DeleteParameters>
</asp:SqlDataSource>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
</asp:Content>
