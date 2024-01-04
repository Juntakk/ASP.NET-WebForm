<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Projet_AppTrans.Models.Login" %>




<asp:Content ID="Content1" ContentPlaceHolderID="LoginContent" runat="server">
    <h1>Welcome</h1>
    <div class="container-fluid">
        <input type="checkbox" id="flip">
        <div class="cover">
            <div class="front">
                <img src="/Images/login.jpg" alt="1">
                <%--<div class="text">
                    <span class="text-1">Welcome to
                            <br>
                        Django's Market</span>
                    <span class="text-2">Let's get you fed</span>
                </div>--%>
            </div>
            <div class="back">
                <img class="backImg" src="/Images/login.png" alt="2">
                <%--<div class="text">
                    <span class="text-1">Complete miles of journey
                            <br>
                        with one step</span>--%>
                    <%--<span class="text-2">Let's get started</span>--%>
                </div>
            </div>
        </div>
        <div class="forms">
            <div class="form-content">
                <div class="login-form">
                    <div class="title">Login</div>
                    <form action="#">
                        <div class="input-boxes">
                            <div class="input-box">
                                <i class="fas fa-envelope"></i>
                                <asp:TextBox ID="email_id" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-box">
                                <i class="fas fa-lock"></i>
                                <asp:TextBox ID="password_id" runat="server" TextMode="Password"></asp:TextBox>

                            </div>
                            <div class="button input-box">
                                <asp:Button ID="Connection" runat="server" Text="Login" OnClick="Connection_Click"  />
                            </div>
                            <div class="text sign-up-text">
                                Don't have an account?
                                    <label for="flip">Sign up now</label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="signup-form">
                    <div class="title">Signup</div>
                    <form action="#">
                        <div class="input-boxes">
                            <div class="input-box">
                                <i class="fas fa-user"></i>
                                <input type="text" placeholder="Enter your name" required>
                            </div>
                            <div class="input-box">
                                <i class="fas fa-envelope"></i>
                                <input type="text" placeholder="Enter your email" required>
                            </div>
                            <div class="input-box">
                                <i class="fas fa-lock"></i>
                                <input type="password" placeholder="Enter your password" required>
                            </div>
                            <div class="button input-box">
                                <input type="submit" value="Sumbit">
                            </div>
                            <div class="text sign-up-text">Already have an account?
                                <label for="flip">Login now</label></div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
</asp:Content>



