<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="OganiWeb.Admin.AddCategory" %>
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
                    <asp:TextBox ID="CategoryName" runat="server" placeholder="Category Name"></asp:TextBox>
                </div>
                <div class="col-lg-12 text-center">                   
                    <asp:Button ID="SaveCategory" runat="server" CssClass="site-btn" Text="Save Category" OnClick="SaveCategory_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
