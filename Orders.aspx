<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="OganiWeb.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%@ Import Namespace="OganiWeb" %>
    <%@ Import Namespace="System.Data" %>


    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Your Orders</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>





    <section class="shoping-cart spad">
        <div class="container">
            
             <%
            DbWork db = new DbWork();
            DataTable orders = db.getCheckoutOrder(Session["uid"].ToString());

            foreach (DataRow orderRow in orders.Rows)
            {
                string CheckoutOrderId = orderRow["CheckoutOrderId"].ToString();
                string OrderDate = orderRow["OrderDate"].ToString();

        %>
            
            
            <div class="row border my-5 py-2">
                <div class="col-lg-8">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Sr No.</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                 <%

                                     DataTable products = db.getCheckoutProduct(CheckoutOrderId);
                                     int total = 0;
                                     int srno = 1;
                                     foreach (DataRow productRow in products.Rows)
                                     {
                                         string pname = productRow["Pname"].ToString();
                                         string Price = productRow["Price"].ToString();
                                         total += Convert.ToInt32(Price);

                        %>
                                <tr>
                                    <td class="shoping__cart__item"><%= srno++ %></td>
                                    <td class="shoping__cart__quantity"><%=pname %></td>
                                    <td class="shoping__cart__price"><%= Price %></td>
                                </tr> 
                                
                                <%
                            }
                        %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="shoping__checkout" style="margin-top:0;">
                        <div class="row">
                            <div class="col-md-6">OrderId:<%= CheckoutOrderId %> </div>
                            <div class="col-md-6">Date:<%= OrderDate %></div>
                        </div>
                        <br /><br />
                        <h5>Order Total</h5>
                        <ul>
                            <li>Total <span>$<%=total %></span></li>
                        </ul>
                    </div>
                </div>
            </div>

            <%



            }

        %>

            
        </div>
    </section>





</asp:Content>
