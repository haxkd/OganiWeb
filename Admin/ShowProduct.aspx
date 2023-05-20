<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ShowProduct.aspx.cs" Inherits="OganiWeb.Admin.ShowProduct" %>

<%@ Import Namespace="OganiWeb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">Product Name</th>
                                    <th>Product Price</th>
                                    <th>Product Image</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>

                                <%
                                    DbWork db = new DbWork();
                                    db.reader = db.getAllProducts();
                                    while (db.reader.Read())
                                    {

                                %>
                                <tr>
                                    <td class="shoping__cart__item"><%= db.reader["ProductName"] %></td>
                                    <td><%= db.reader["ProductPrice"] %></td>
                                    <td>
                                        <img src='/img/products/<%= db.reader["ProductImage"] %>'></td>
                                    <td><a href="EditProduct.aspx?PId=<%= db.reader["ProductId"] %>" class="btn btn-outline-success">Edit</a></td>
                                    <td><a href="DeleteProduct.aspx?PId=<%= db.reader["ProductId"] %>" onclick="return confirm('Are Your agree to delete?')" class="btn btn-outline-danger">Delete</a></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
