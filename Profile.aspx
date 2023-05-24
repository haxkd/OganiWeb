<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="OganiWeb.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="blog__details__content">
            <div class="row">
                <div class="col-lg-6">
                    <div class="blog__details__author">
                        <div class="blog__details__author__pic">
                            <img src="img/blog/details/details-author.jpg" alt="">
                        </div>
                        <div class="blog__details__author__text">
                            <h6 id="name" runat="server">Michael Scofield</h6>
                            <span id="email" runat="server">Admin</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
