<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="OganiWeb.Cart" %>
<%@ import Namespace="OganiWeb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Product</th>
                                    <th>Price</th>
                                    <th>Remove Product</th>
                                </tr>
                            </thead>
                            <tbody>

                                <% DbWork db = new DbWork();
                                    db.reader = db.getCartProducts(Session["uid"].ToString());
                                    int price = 0;
                                    while (db.reader.Read())
                                    {
                                        price += Convert.ToInt32(db.reader["ProductPrice"]);
                                        %>


                                
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img src="/img/products/<%=db.reader["ProductImage"] %>" alt="">
                                        <h5><%=db.reader["ProductName"] %></h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        $<%=db.reader["ProductPrice"] %>
                                    </td>                                    
                                    <td class="shoping__cart__item__close">
                                        <a href='removeCart.aspx?cid=<%=db.reader["cid"] %>'><span class="icon_close"></span></a>
                                    </td>
                                </tr>
                                <%
                                    }
                                    totalPrice.InnerText += price.ToString();
                                    %>
                               
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>Discount Codes</h5>
                                <input type="text" placeholder="Enter your coupon code">
                                <button type="submit" class="site-btn">APPLY COUPON</button>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__checkout">
                        <h5>Cart Total</h5>
                        <ul>
                            <li>Total <span id="totalPrice" runat="server">$</span></li>
                        </ul>
                        <a href="/Checkout.aspx" class="primary-btn">PROCEED TO CHECKOUT</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shoping Cart Section End -->
</asp:Content>
