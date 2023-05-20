<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="OganiWeb.Admin.EditProduct" %>
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
                    <asp:TextBox ID="ProductName" runat="server" placeholder="Product Name"></asp:TextBox>
                </div>
                <div class="col-lg-6 col-md-6">
                    <asp:TextBox ID="ProductPrice" runat="server" placeholder="Product Price"></asp:TextBox>

                </div>
                <div class="col-lg-6 col-md-6">
                    <asp:TextBox ID="ProductDesc" runat="server" TextMode="MultiLine" placeholder="Product Desc"></asp:TextBox>

                </div>
                <div class="col-lg-6 col-md-6">
                    <asp:FileUpload ID="ProductImage" runat="server" />
                </div>
                <div class="col-lg-6 col-md-6">
                    <asp:DropDownList ID="CategoryList" runat="server"></asp:DropDownList>
                </div>
                <div class="col-lg-12 text-center">
                       <asp:Button ID="UpdateProduct" runat="server" Text="update" OnClick="UpdateProduct_Click"/>
                </div>
            </div>

        </div>
    </div>


</asp:Content>
