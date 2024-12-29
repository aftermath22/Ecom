<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 11/20/2024
  Time: 3:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="org.keval.ecom.model.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="org.keval.ecom.service.ItemService" %>
<%@ page import="org.keval.ecom.model.Items" %>
<%
    List<Cart> cartList = (List<Cart>) request.getAttribute("cart");
    ItemService itemService = (ItemService) request.getAttribute("itemService");
    Long grandtot = 0L;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${customer.name}'s Cart</title>
    <style>
        :root {
            --bg-color-light: #f4f4f9;
            --text-color-light: #333;
            --table-bg-light: #fff;
            --link-color-light: #007bff;
            --button-bg-light: #007bff;

            --bg-color-dark: #181818;
            --text-color-dark: #ddd;
            --table-bg-dark: #333;
            --link-color-dark: #66aaff;
            --button-bg-dark: #338cff;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: var(--bg-color-light);
            color: var(--text-color-light);
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            transition: background-color 0.3s, color 0.3s;
        }

        .dark-mode {
            background-color: var(--bg-color-dark);
            color: var(--text-color-dark);
        }

        h1 {
            text-align: center;
            color: inherit;
            margin-top: 20px;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: var(--table-bg-light);
            transition: background-color 0.3s;
        }

        .dark-mode table {
            background-color: var(--table-bg-dark);
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: var(--link-color-light);
            color: #fff;
        }

        .dark-mode th {
            background-color: var(--link-color-dark);
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .dark-mode tr:nth-child(even) {
            background-color: #444;
        }

        tr:hover {
            background-color: #ddd;
        }

        .dark-mode tr:hover {
            background-color: #555;
        }

        .button {
            display: inline-block;
            font-size: 16px;
            color: white;
            text-decoration: none;
            margin: 10px;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: var(--button-bg-light);
            transition: background-color 0.3s, transform 0.3s;
            text-align: center;
        }

        .dark-mode .button {
            background-color: var(--button-bg-dark);
        }

        .button:hover {
            transform: scale(1.05);
            background-color: #0056b3;
        }

        .dark-mode .button:hover {
            background-color: #1c73e8;
        }

        #toggle-dark-mode {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            background-color: var(--link-color-light);
            color: white;
            transition: background-color 0.3s;
        }

        .dark-mode #toggle-dark-mode {
            background-color: var(--link-color-dark);
        }

        #toggle-dark-mode:hover {
            background-color: #0056b3;
        }

        .dark-mode #toggle-dark-mode:hover {
            background-color: #338cff;
        }
    </style>
    <script>
        function toggleDarkMode() {
            document.body.classList.toggle('dark-mode');
            const isDarkMode = document.body.classList.contains('dark-mode');
            localStorage.setItem('darkMode', isDarkMode);
        }

        window.onload = function() {
            const darkMode = localStorage.getItem('darkMode');
            if (darkMode === 'true') {
                document.body.classList.add('dark-mode');
            }
        }
    </script>
</head>
<body>
<button id="toggle-dark-mode" onclick="toggleDarkMode()">Toggle Dark Mode</button>

<h1>${customer.name}'s Cart</h1>
<div>
    <% if (cartList != null && !cartList.isEmpty()) { %>
    <table>
        <thead>
        <tr>
            <th>Cart ID</th>
            <th>Item ID</th>
            <th>Item Quantity</th>
            <th>Item Name</th>
            <th>Item Price</th>
            <th>Add More</th>
            <th>Remove</th>
        </tr>
        </thead>
        <tbody>
        <% for (Cart cart : cartList) {
            Items it = itemService.getItemById(cart.getItemId());
            grandtot += (cart.getItQuantity() * it.getItemPrice());
        %>
        <tr>
            <td><%= cart.getCartId() %></td>
            <td><%= cart.getItemId() %></td>
            <td><%= cart.getItQuantity() %></td>
            <td><%= it.getItemName() %></td>
            <td><%= it.getItemPrice() %></td>
            <td>
                <% if (it.isAvailable()) { %>
                <form action="/user/adds" method="post">
                    <input type="number" min="1" required name="adds">
                    <input type="hidden" name="itid" value="<%= cart.getItemId() %>">
                    <input type="submit" value="Add">
                </form>
                <% } else { %>
                Not Available
                <% } %>
            </td>
            <td>
                <% if (it.isAvailable()) { %>
                <form action="/user/remove" method="post">
                    <input type="number" min="1" max="<%= cart.getItQuantity() %>" required name="rems">
                    <input type="hidden" name="itid" value="<%= cart.getItemId() %>">
                    <input type="submit" value="Remove">
                </form>
                <% } else { %>
                Not Available
                <% } %>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <p>Grand Total: <%= grandtot %></p>
    <% } else { %>
    <p>No items in the cart.</p>
    <% } %>
    <a href="/items" class="button">Shop Items</a> <br>
    <a href="/user/portal" class="button">Back to User Portal</a> <br>
    <a href="/logout" class="button" style="background-color: #e62b2b">Logout</a> <br>
</div>
</body>
</html>
