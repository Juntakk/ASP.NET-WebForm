<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="Projet_AppTrans.Customers.MainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="UserContent" runat="server">


    <div class="hero-image">

        <h1 class="ms-5 ">Welcome to my Market</h1>
        <h4 class="ms-5 mt-3">Shop at your own risk</h4>
        <a class="btn1" href="./Vegetables">Start shopping</a>
    </div>

    <div class="d-flex justify-content-center mt-5">
        <h1>About us</h1>
    </div>

    <div class="container">
        <div class="row p-5 mt-1">
            <div class="col-md-7 ">
                <h3>Welcome to our friendly neighborhood market, where community and quality come together to create a unique shopping experience. At our market, we take pride in being more than just a place to shop; we're a hub for connection and local goodness. Join us at the heart of our community, where smiles are as abundant as our fresh offerings, and where everyone is not just a customer but an essential part of our friendly market family.
                </h3>
            </div>
            <div class="col-md-5 ">
                <img class="rounded-3" src="../Images/a1.jpg" height="350px" width="500px" />
            </div>
        </div>
    </div>
</asp:Content>
