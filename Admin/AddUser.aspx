<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="Projet_AppTrans.Admin.AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="contAdmin container">
        <asp:Label ID="user_confirmation" runat="server" Visible="true"></asp:Label>
        <div class="row">
            <div class="col-md-3 ms-5">
                <div class="form-container">
                    <div class="form-group mt-3 w-50">
                        <label>Name</label>
                        <asp:TextBox ID="user_name" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Required*" ForeColor="Red" ValidationGroup="products_group" ControlToValidate="user_name"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label5" runat="server" Visible="True"></asp:Label>
                    </div>
                    <div class="form-group w-50">
                        <label>Email</label>
                        <asp:TextBox ID="user_email" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Required*" ForeColor="Red" ValidationGroup="products_group" ControlToValidate="user_email"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label4" runat="server" Visible="True"></asp:Label>
                    </div>
                    <div class="form-group w-50">
                        <label>Password</label>
                        <asp:TextBox ID="user_password" runat="server" CssClass="form-control"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Required*" ForeColor="Red" ValidationGroup="products_group" ControlToValidate="user_password"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label3" runat="server" Visible="True"></asp:Label>
                    </div>

                    <asp:Button CssClass="btn2" ID="add_user" runat="server" Text="Add User" OnClick="add_user_Click" /><br />
                </div>
            </div>
            <div class="col-md-4">
                <asp:GridView ID="GridView1" CssClass="gridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" BorderStyle="Double" BorderColor="#336666" BorderWidth="3px" AllowPaging="True" AllowSorting="True" PageSize="5" CellPadding="4" BackColor="White" GridLines="Horizontal">
                    <Columns>

                        <asp:BoundField DataField="id" HeaderText="id" HeaderStyle-Font-Size="X-Large" InsertVisible="False" ReadOnly="True" SortExpression="id" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                        </asp:BoundField>
                        <asp:BoundField DataField="email" HeaderText="email" HeaderStyle-Font-Size="X-Large" SortExpression="email">
                        </asp:BoundField>
                        <asp:BoundField DataField="password" HeaderText="password" HeaderStyle-Font-Size="X-Large" SortExpression="password">
                        </asp:BoundField>
                        <asp:BoundField DataField="is_Admin" HeaderText="is_Admin" HeaderStyle-Font-Size="X-Large" SortExpression="is_Admin">
                        </asp:BoundField>
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#333333" />
                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#487575" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#275353" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FINALDB %>" SelectCommand="SELECT * FROM [Customer]" ProviderName="<%$ ConnectionStrings:FINALDB.ProviderName %>">

                </asp:SqlDataSource>


            </div>
        </div>

    </div>

</asp:Content>
