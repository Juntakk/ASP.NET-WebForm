<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Projet_AppTrans.Customers.Cart" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="UserContent" runat="server">
    <%--        <h1 class="mt-3"><center>Cart</center></h1>--%>

<div class="cont container mt-5 w-50">
  <form>
    <asp:Repeater ID="rptCart" runat="server">
      <ItemTemplate>
        <div class="ro row mb-3 mt-3">
          <div class="col-md-3">
            <asp:Image class="rounded" ID="image_id" runat="server" ImageUrl='<%# Eval("image_path") %>' Width="100" Height="70" />
          </div>
          <div class="col-md-3 mt-3">
            <asp:Label CssClass="name" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
          </div>
          <div class="col-md-2 mt-3">
            <asp:Label CssClass="price" ID="price_id" runat="server" Text='<%# Eval("price") + "$" %>'></asp:Label>
          </div>
          <div class="col-md-2 mt-3">
            <asp:Label CssClass="quantity" ID="quantity_id" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
          </div>
            <div class="col-md-2 mt-3 rounded">
              <asp:Button  CssClass="removeCart" ID="RemoveButton" runat="server" Text="Remove" OnClick="RemoveFromCart_click" CommandArgument='<%# Eval("id") %>' />
            </div>
        </div>
      </ItemTemplate>
    </asp:Repeater>
  </form>
<asp:Label class="fw-bold fs-5" ID="total_id" runat="server" Text="Total: "></asp:Label><br />
    <asp:Button class="mt-3 mb-2 p-2 rounded fs-4 fw-bolder bg-success " ID="checkout" runat="server" Text="Purchase" OnClick="purchase_click" />
</div>
    
    

</asp:Content>

