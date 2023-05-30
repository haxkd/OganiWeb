<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="OganiWeb.Checkout" %>

<%@ Import Namespace="OganiWeb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Checkout</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span>Have a coupon? <a href="#">Click here</a> to enter your code
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>Billing Details</h4>
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Fist Name<span>*</span></p>
                                        <input type="text" id="fname" runat="server">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Last Name<span>*</span></p>
                                        <input type="text" id="lname" runat="server">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Country<span>*</span></p>
                                <input type="text"  id="country" runat="server">
                            </div>
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <textarea type="text" placeholder="Street Address" class="checkout__input__add"  id="address" runat="server"></textarea>
                            </div>
                            <div class="checkout__input">
                                <p>Town/City<span>*</span></p>
                                <input type="text"  id="city" runat="server">
                            </div>
                            <div class="checkout__input">
                                <p>State<span>*</span></p>
                                <input type="text"  id="state" runat="server">
                            </div>
                            <div class="checkout__input">
                                <p>Pincode / ZIP<span>*</span></p>
                                <input type="text"  id="pincode" runat="server">
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="text"  id="phone" runat="server">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="text" id="email" runat="server" readonly>
                                    </div>
                                </div>
                            </div>                            
                            <div class="checkout__input">
                                <p>Order notes<span>*</span></p>
                                <input type="text"
                                    placeholder="Notes about your order, e.g. special notes for delivery." id="othernotes" runat="server">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>Your Order</h4>
                                <div class="checkout__order__products">Products <span>Total</span></div>
                                <ul>
                                    <% DbWork db = new DbWork();
                                        db.reader = db.getCartProducts(Session["uid"].ToString());
                                        int price = 0;
                                        while (db.reader.Read())
                                        {
                                            price += Convert.ToInt32(db.reader["ProductPrice"]);
                                    %>

                                    <li><%=db.reader["ProductName"] %> <span>$<%=db.reader["ProductPrice"] %></span></li>
                                    <%}
                                        totalPrice.InnerText += price.ToString();
                                    %>
                                </ul>
                                <div class="checkout__order__total">Total <span id="totalPrice" runat="server">$</span></div>
                                                                                                                               
                                <asp:Button ID="checkoutBtn" runat="server" Text="PLACE ORDER" CssClass="site-btn" OnClick="checkoutBtn_Click" />
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->


</asp:Content>
