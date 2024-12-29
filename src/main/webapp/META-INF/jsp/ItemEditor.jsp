<%@ page import="org.keval.ecom.model.Items" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 11/20/2024
  Time: 12:37 AM
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Item</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        p {
            font-size: 14px;
            margin-bottom: 10px;
        }

        p[style="color: green;"] {
            color: green;
            font-weight: bold;
        }

        p[style="color: red;"] {
            color: red;
            font-weight: bold;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="checkbox"] {
            margin-right: 10px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .form-group {
            width: 100%;
            text-align: left;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit Item</h1>

    <!-- Display Success/Error Message -->
    <%
        String message = (String) request.getAttribute("message");
        String error = (String) request.getAttribute("error");
        if (message != null) {
    %>
    <p style="color: green;"><%= message %></p>
    <%
        }
        if (error != null) {
    %>
    <p style="color: red;"><%= error %></p>
    <% } %>

    <%
        Items it = (Items) session.getAttribute("item");
    %>
    <!-- Form starts -->
    <form action="/admin/editIt" method="post">
        <div class="form-group">
            <label for="itemName">Item Name:</label>
            <input type="text" id="itemName" name="itemName" value="<%=it.getItemName()%>" required>
        </div>

        <div class="form-group">
            <label for="itemDescription">Item Description:</label>
            <input type="text" id="itemDescription" name="itemDescription" value="<%=it.getItemDescription()%>" required>
        </div>

        <div class="form-group">
            <label for="itemType">Item Type:</label>
            <input type="text" id="itemType" name="itemType" value="<%=it.getItemType()%>" required>
        </div>

        <div class="form-group">
            <label for="itemPrice">Item Price:</label>
            <input type="number" id="itemPrice" name="itemPrice" value="<%=it.getItemPrice()%>" required>
        </div>

        <!-- Hidden input with default false -->
<%--        <input type="hidden" name="isAvailable" value="false">--%>

        <div class="form-group">
            <label for="isAvailable">
                <input type="checkbox" id="isAvailable" name="isAvailable" value="true"
                    <%= request.getAttribute("isAvailable") != null && (boolean) request.getAttribute("isAvailable") ? "checked" : "" %>>
                Available
            </label>
        </div>

        <input type="submit" value="Confirm">
    </form>
    <!-- Form ends -->
</div>
</body>
</html>
