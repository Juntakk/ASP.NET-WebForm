<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AjouterProduits.aspx.cs" Inherits="Projet_AppTrans.AjouterProduits" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="mt-3"><center>Add a product</center></h1>
    <table style="width:40%; margin-left:550px;">
       
        <tr>
            <td>Name: </td>
            <td><asp:TextBox ID="product_name_id" runat="server" Width="387px"></asp:TextBox>
            </td>
           
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required*" ForeColor="Red" ValidationGroup="products_group" ControlToValidate="product_name_id"></asp:RequiredFieldValidator>
            </td>
           
        </tr>
        <tr>
            <td>Quantity: </td>
            <td><asp:TextBox ID="product_quantity_id" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
    <td>Price: </td>
    <td>
        <asp:TextBox ID="product_price_id" runat="server" ValidationGroup="productsGroup"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required*" ForeColor="Red" ValidationGroup="products_group" ControlToValidate="product_price_id"></asp:RequiredFieldValidator>

    </td>
   
</tr>

                <tr>
    <td>Category: </td>
    <td><asp:TextBox ID="product_category_id" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Required*" ForeColor="Red" ValidationGroup="products_group" ControlToValidate="product_category_id"></asp:RequiredFieldValidator>

    </td>
   
</tr>
        
    </table>
    


    <asp:Button ID="btnAddProduct" runat="server" Text="Ajouter" OnClick="btnAddProduct_Click" ValidationGroup="products_group" />
    <asp:FileUpload ID="image_path" runat="server" control="fileUploadControl" />
    <asp:Label ID="productsConfirmation" runat="server" Visible="True"></asp:Label>


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Width="972px" Height="87px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowEditing="GridView1_RowEditing">
        <Columns>

            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:BoundField DataField="category_id" HeaderText="category_id" SortExpression="category_id" />
<asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image_path") %>' Width="50" Height="50" />
            </ItemTemplate>
        </asp:TemplateField>            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ButtonType="Button" EditText="Edit" DeleteText="Delete"> 
                       </asp:CommandField>
        </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProjetConnectionString %>" SelectCommand="SELECT * FROM [Products]" OnSelecting="SqlDataSource1_Selecting" 
            UpdateCommand="UPDATE Products SET name = @name, quantity = @quantity, price = @price, category_id = @category_id, image_path = @image_path  WHERE ID = @ID"
            DeleteCommand="DELETE FROM Products WHERE ID = @ID">

            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="quantity" Type="Int32" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="category_id" Type="Int32" />
                <asp:Parameter Name="image_path" Type="String" />
            </UpdateParameters>

            <DeleteParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="quantity" Type="Int32" />
                <asp:Parameter Name="price" Type="Double" />
                <asp:Parameter Name="category_id" Type="Int32" />
                <asp:Parameter Name="image_path" Type="String" />
            </DeleteParameters>


        </asp:SqlDataSource>


</asp:Content>