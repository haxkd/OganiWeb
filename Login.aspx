<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OganiWeb.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>Leave Message</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                
                <div class="col-lg-6 col-md-6">
                    <asp:TextBox ID="uemail" runat="server" TextMode="Email" placeholder="user Email"></asp:TextBox>
                </div>
                <div class="col-lg-6 col-md-6">
                    <asp:TextBox ID="upassword" runat="server" TextMode="Password" placeholder="user password"></asp:TextBox>
                </div>
                
                <div class="col-lg-12 text-center">
                       <asp:Button ID="login" runat="server" class="site-btn" Text="login" OnClick="login_Click" />
                </div>
            </div>

        </div>
    </div>


</asp:Content>
