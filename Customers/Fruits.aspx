<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="Fruits.aspx.cs" Inherits="Projet_AppTrans.Customers.Fruits" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserContent" runat="server">
   <%-- <h1 class="mt-3">
        <center>Fruits</center>
    </h1>--%>

    <asp:Label ID="message_id" runat="server" Text=""></asp:Label>

     <form>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-10 p-2">

                <asp:Repeater ID="repeater" runat="server" EnableViewState="true">
                    <ItemTemplate>
                        <div style="padding:10px;background-color: wheat; opacity: 90%; float: left; display: flex; justify-content: center; align-items: center; margin-right: 40px; margin-top: 40px; border: 2px solid black; border-radius: 10px;">
                            <div class="main1" style="width: 200px; text-align: center;">
                                <asp:Label ID="product_id" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                                <asp:Label class="fw-bold fs-4" ID="product_name_id" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                <p class="mb-2" style="white-space: normal; font-style: italic;"><%# Eval("description") %></p>
                                <asp:Image class="rounded" ID="image_id" runat="server" ImageUrl='<%# Eval("image_path") %>' Width="175" Height="130" /><br />
                                <asp:Label ID="product_price_id" class="fs-4 mb-1 fw-bolder " runat="server" Text='<%# Eval("price")%>'></asp:Label><br />
                                <asp:Button CssClass="rounded bg-danger fw-bolder text-white" ID="Button1" runat="server" Text="-" Width="35px" Height="35px" Style="text-align: center; line-height: 15px;" OnClick="LowerArticles" />
                                <asp:Label CssClass="fw-bolder fs-5" ID="quantity_id" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                <asp:Button CssClass="rounded bg-success fw-bolder text-white mb-2" ID="Button2" runat="server" Text="+" Width="35px" Height="35px" Style="text-align: center; line-height: 15px;" OnClick="IncrementArticles" /><br />
                                <asp:Button class="btnAddCart" ID="addCart" runat="server" Text="Add to Cart" OnClick="AddToCart" /><br />
                                <asp:Label ID="cart_conf" runat="server" Text=""></asp:Label>
                            </div>
                        </div>

                    </ItemTemplate>
                    <FooterTemplate>
                        <div style="clear: both;"></div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>

            <div class="col-md-2 ">
                <div class="form-container">
                    <div class="form-group mt-5">
                        <asp:TextBox ID="search_id" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:Button ID="search_btn" runat="server" Text="Search" OnClick="Find" CssClass="btnSearch" />
                    </div>
                    <asp:Label ID="search_error" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>

</form>

</asp:Content>

