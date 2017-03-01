<%-- 
    Document   : order
    Created on : Feb 28, 2017, 7:49 PM
    Author     : Travis Mitchell
--%>

<%@page import="pizzamvc.PizzaOrder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Travis' Online Pizza Store</title>
        <link rel="stylesheet" href="mystyle.css">
    </head>
    <body>
        <h1><a href="home.html">Travis' Online Pizza Store</a></h1>
        <h2>Order Success! Thank you for your order!</h2>
        <h3>Order details:</h3>
        <p>Email = ${myOrder.email}</p>
        <p>Size = ${myOrder.size}</p>
        <p>Toppings: ${myOrder.toppings}
             <p>
            <%
            String[] toppingArray = request.getParameterValues("toppings");
            double price = 0.0;
            if (toppingArray != null && toppingArray.length > 0) {
                if (toppingArray.length == 1) {
                    price += 0.75;
                } else if (toppingArray.length > 1) {
                    for (int i = 0; i < toppingArray.length; i++) {
                        price += 0.75;
                    }
                }
            }
            if (request.getParameter("size").equals("small")) {
                price += 5.00;
            } else if (request.getParameter("size").equals("medium")) {
                price += 6.00;
            } else if (request.getParameter("size").equals("large")) {
                price += 7.00;
            }
            if (request.getParameter("style").equals("pan")) {
                price += 1.00;
            } else if (request.getParameter("style").equals("hand-tossed")) {
                price += 0.50;
            }
            out.println("<p>Order Price = $" + price + "</p>");
        %> 
        </p>
        <p><a href='home.html'>Return to home page</a></p>
    </body>
</html>
