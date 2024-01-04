<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="Vegetables.aspx.cs" Inherits="Projet_AppTrans.Vegetables" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserContent" runat="server">
    <h1><center>Vegetables</center></h1>

  <div class="container-fluid">
        <div class="row d-flex align-content-center">
            <div class="col-md-4">
                <label>Search vegetable : </label><asp:TextBox runat="server" Height="22px" Width="200px"></asp:TextBox>
            </div>
            <div class="col-md-8">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="1000px">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                        <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image_path") %>' Width="100" Height="100" />
            </ItemTemplate>
        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjetConnectionString4 %>" ProviderName="<%$ ConnectionStrings:ProjetConnectionString4.ProviderName %>" SelectCommand="SELECT Name, Price, Image_path FROM products WHERE category_id = 1;"></asp:SqlDataSource>
           </div>
        </div>
    </div>
</asp:Content>
