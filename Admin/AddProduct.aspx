<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AjouterProduits.aspx.cs" Inherits="Projet_AppTrans.AjouterProduits" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <asp:Label ID="productsConfirmation" runat="server" Text=""></asp:Label>

        <div class="row">

            <div class="col-md-3">
                <div class="form-container">
                    <div class="form-group mt-3 w-75">
                        <label>Name</label>
                        <asp:TextBox ID="product_name_id" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Required*" ForeColor="Red" ValidationGroup="products_group" ControlToValidate="product_name_id"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label5" runat="server" Visible="True"></asp:Label>
                    </div>
                    <div class="form-group w-75">
                        <label>Price</label>
                        <asp:TextBox ID="product_price_id" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Required*" ForeColor="Red" ValidationGroup="products_group" ControlToValidate="product_price_id"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label4" runat="server" Visible="True"></asp:Label>
                    </div>
                    <div class="form-group w-75">
                        <label>Category Number</label>
                        <asp:TextBox ID="product_category_id" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Required*" ForeColor="Red" ValidationGroup="products_group" ControlToValidate="product_category_id"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label3" runat="server" Visible="True"></asp:Label>
                    </div>
                    <div class="form-group w-75">
                        <label>Quantity</label>
                        <asp:TextBox ID="product_quantity_id" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Required*" ForeColor="Red" ValidationGroup="products_group" ControlToValidate="product_quantity_id"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label2" runat="server" Visible="True"></asp:Label>
                    </div>
                    <div class="form-group w-75">
                        <label>Description</label>
                        <asp:TextBox ID="description_id" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required*" ForeColor="Red" ValidationGroup="products_group" ControlToValidate="description_id"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label1" runat="server" Visible="True"></asp:Label>
                    </div>


                    <asp:FileUpload CssClass="fileUpload" ID="image_path" runat="server" control="fileUploadControl" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required*" ForeColor="Red" ValidationGroup="products_group" ControlToValidate="image_path"></asp:RequiredFieldValidator>
                </div>
                <asp:Button CssClass="btn2" ID="btnAddProduct" runat="server" Text="Add Product" OnClick="BtnAddProduct_Click" ValidationGroup="products_group" />
                <br />
            </div>



            <div class="col-md-6 w-25">
                <asp:GridView ID="GridView1" CssClass="gridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowEditing="GridView1_RowEditing" BorderStyle="Double" BorderColor="#336666" BorderWidth="3px" AllowPaging="True" AllowSorting="True" PageSize="4" BackColor="White" CellPadding="4" GridLines="Horizontal">
                    <Columns>

                        <asp:BoundField DataField="id" HeaderText="ID" HeaderStyle-Font-Size="X-Large" InsertVisible="False" ReadOnly="True" SortExpression="id" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                            <HeaderStyle Font-Size="X-Large"></HeaderStyle>

                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>

                        <asp:BoundField DataField="name" HeaderText="Name" HeaderStyle-Font-Size="X-Large" SortExpression="name">
                            <HeaderStyle Font-Size="X-Large"></HeaderStyle>

                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="price" HeaderText="Price" HeaderStyle-Font-Size="X-Large" SortExpression="price">
                            <HeaderStyle Font-Size="X-Large"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="description" HeaderText="Description" HeaderStyle-Font-Size="X-Large" SortExpression="Description">


                            <HeaderStyle Font-Size="X-Large"></HeaderStyle>
                        </asp:BoundField>


                        <asp:BoundField DataField="category_id" HeaderText="Category" HeaderStyle-Font-Size="X-Large" SortExpression="category_id">
                            <HeaderStyle Font-Size="X-Large"></HeaderStyle>

                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:Image ID="Image1" CssClass="rounded" runat="server" ImageUrl='<%# Eval("image_path") %>' Width="100" Height="85" />

                            </ItemTemplate>
                            <ItemStyle CssClass="productImg" />
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ButtonType="Button" EditText="Edit" DeleteText="Delete" FooterStyle-BackColor="Red">
                            <ControlStyle CssClass="productBtn" />

                            <FooterStyle BackColor="Red"></FooterStyle>
                        </asp:CommandField>

                    </Columns>

                    <FooterStyle BackColor="White" ForeColor="#333333" />

                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" Height="30" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" Font-Size="17" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>
            </div>
        </div>
    </div>








    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINALDB %>" SelectCommand="SELECT * FROM [Products]" OnSelecting="SqlDataSource1_Selecting">

    </asp:SqlDataSource>


</asp:Content>
