<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="Wish shop project">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.css">
    <link href="${pageContext.request.contextPath}/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
          rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/styles/cart.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/styles/cart_responsive.css">
    <style>
        .cart_product_image img {
            width: 300px;
            height: 300px;
            object-fit: contain;
            object-position: center;
        }

        #cust_table {
            margin-top: 30px;
            line-height: 30px;
        }

        .cust_table_td {
            width: 300px;
            padding-left: 30px;
        }

        .cust_table_td_title {
            font-size: 14px;
            font-weight: 600;
            color: #232323;
        }
    </style>
</head>
<body>
<div class="super_container">

    <jsp:include page="../fragment/index_navbar.jsp"></jsp:include>

    <!-- Home -->

    <div class="home">
        <div class="home_background parallax-window" data-parallax="scroll"
             data-image-src="https://storage.googleapis.com/fastdate-image/cart.jpg"
             data-speed="0.8"></div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="home_container">
                        <div class="home_content">
                            <div class="home_title">Invoice Detail</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Cart -->

    <div class="cart_container">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="cart_title">Customer Information</div>
                    <table id="cust_table">
                        <tr>
                            <td class="cust_table_td_title">Customer name</td>
                            <td class="cust_table_td">${invoice.custName}</td>
                        </tr>
                        <tr>
                            <td class="cust_table_td_title">Address</td>
                            <td class="cust_table_td">${invoice.custAddress}</td>
                        </tr>
                        <tr>
                            <td class="cust_table_td_title">Phone Number</td>
                            <td class="cust_table_td">${invoice.custPhoneNo}</td>
                        </tr>
                        <tr>
                            <td class="cust_table_td_title">Order Time</td>
                            <td class="cust_table_td">${invoice.createDateTime}</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="cart_bar d-flex flex-row align-items-center justify-content-start">
                        <div class="cart_bar_title_name">Product</div>
                        <div class="cart_bar_title_content ml-auto">
                            <div class="cart_bar_title_content_inner d-flex flex-row align-items-center justify-content-end">
                                <div class="cart_bar_title_price">Price</div>
                                <div class="cart_bar_title_quantity">Quantity</div>
                                <div class="cart_bar_title_total">Total</div>
                                <div class="cart_bar_title_button"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <div class="cart_products">
                        <c:set var="total" value="0"></c:set>
                        <ul>
                            <c:forEach var="item" items="${invoice.products}">
                                <c:set var="product" value="${item.key}"></c:set>
                                <c:set var="quantity" value="${item.value}"></c:set>
                                <c:set var="total" value="${total + product.price * quantity }"></c:set>

                                <%-- start cart item--%>
                                <li class="cart_product d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-start">
                                    <!-- Product Image -->
                                    <div class="cart_product_image"><img src="${product.imageUrl}" alt=""></div>
                                    <!-- Product Name -->
                                    <div class="cart_product_name"><a
                                            href="${pageContext.request.contextPath}?id=${product.id}">
                                            ${product.name}
                                    </a></div>
                                    <div class="cart_product_info ml-auto">
                                        <div class="cart_product_info_inner d-flex flex-row align-items-center justify-content-md-end justify-content-start">
                                            <!-- Product Price -->
                                            <div class="cart_product_price"><fmt:formatNumber value="${product.price}"
                                                                                              type="number"/>
                                                <small style="font-size: .8rem; margin-left: 2px;">vnd</small>
                                            </div>
                                            <!-- Product Quantity -->
                                            <div class="product_quantity_container">
                                                <div class="product_quantity clearfix">
                                                    <input id="quantity_input" type="text" pattern="[0-9]*"
                                                           value="${quantity}" disabled>
                                                </div>
                                            </div>
                                            <!-- Products Total Price -->
                                            <div class="cart_product_total"><fmt:formatNumber
                                                    value="${product.price * quantity}"
                                                    type="number"/>
                                                <small style="font-size: .8rem; margin-left: 2px;">vnd</small>
                                            </div>
                                        </div>
                                    </div>
                                </li> <%-- end cart item--%>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row cart_extra">
                <!-- Cart Coupon -->
                <div class="col-lg-6">
                </div>
                <!-- Cart Total -->
                <div class="col-lg-5 offset-lg-1">
                    <div class="cart_total">
                        <div class="cart_title">cart total</div>
                        <ul>
                            <li class="d-flex flex-row align-items-center justify-content-start">
                                <div class="cart_total_title">Subtotal</div>
                                <div class="cart_total_price ml-auto">
                                    <fmt:formatNumber value="${total}" type="number"/>
                                    <small style="font-size: .8rem; margin-left: 2px;">vnd</small>
                                </div>
                            </li>
                            <li class="d-flex flex-row align-items-center justify-content-start">
                                <div class="cart_total_title">Shipping</div>
                                <div class="cart_total_price ml-auto"><fmt:formatNumber value="${0}" type="number"/>
                                    <small style="font-size: .8rem; margin-left: 2px;">vnd</small></div>
                            </li>
                            <li class="d-flex flex-row align-items-center justify-content-start">
                                <div class="cart_total_title">Total</div>
                                <div class="cart_total_price ml-auto"><fmt:formatNumber value="${total}" type="number"/>
                                    <small style="font-size: .8rem; margin-left: 2px;">vnd</small></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../fragment/index_footer.jsp"></jsp:include>
</div>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/easing/easing.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cart_custom.js"></script>
</body>
</html>