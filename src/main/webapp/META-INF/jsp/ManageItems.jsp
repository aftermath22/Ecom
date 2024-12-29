<%@ page import="org.keval.ecom.model.Items" %>
<%@ page import="java.util.List" %>
<%@ page import="org.keval.ecom.model.Customer" %>
<%@ page import="org.keval.ecom.service.CustomerService" %>
<%@ page import="java.security.Principal" %>
<%@ page import="org.hibernate.Session" %>

<%
    // Retrieve the list of items from the HttpSession
    List<Items> itemsList = (List<Items>) session.getAttribute("items");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Items</title>

    <!-- CSS Variables for Light and Dark Mode -->
    <style>
        :root {
            --bg-color-light: #f4f4f9;
            --text-color-light: #333;
            --table-header-bg-light: #007bff;
            --table-row-hover-light: #ddd;
            --button-bg-light: #007bff;
            --button-hover-light: #0056b3;
            --delete-bg-light: #d9534f;

            --bg-color-dark: #333;
            --text-color-dark: #ddd;
            --table-header-bg-dark: #338cff;
            --table-row-hover-dark: #555;
            --button-bg-dark: #338cff;
            --button-hover-dark: #0056b3;
            --delete-bg-dark: #c9302c;
        }

        /* General Page Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: var(--bg-color-light);
            color: var(--text-color-light);
            margin: 0;
            padding: 0;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        /* Dark Mode */
        .dark-mode {
            background-color: var(--bg-color-dark);
            color: var(--text-color-dark);
        }

        h1 {
            text-align: center;
            margin: 20px 0;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th {
            background-color: var(--table-header-bg-light);
            color: white;
            padding: 12px 15px;
            text-align: center;
        }

        .dark-mode th {
            background-color: var(--table-header-bg-dark);
        }

        td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        tr:hover {
            background-color: var(--table-row-hover-light);
        }

        .dark-mode tr:hover {
            background-color: var(--table-row-hover-dark);
        }

        /* Button Styling */
        .button {
            display: inline-block;
            color: white;
            background-color: var(--button-bg-light);
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .dark-mode .button {
            background-color: var(--button-bg-dark);
        }

        .button:hover {
            background-color: var(--button-hover-light);
        }

        .dark-mode .button:hover {
            background-color: var(--button-hover-dark);
        }

        .delete-button {
            color: white;
            background-color: var(--delete-bg-light);
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .dark-mode .delete-button {
            background-color: var(--delete-bg-dark);
        }

        .delete-button:hover {
            opacity: 0.8;
        }
    </style>

    <!-- JavaScript for Dark Mode Toggling -->
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
<!-- Dark Mode Toggle -->
<div style="text-align: right; padding: 10px;">
    <button onclick="toggleDarkMode()" class="button">Toggle Dark Mode</button>
</div>

<div>
    <h1>Item List</h1>

    <% if (itemsList != null && !itemsList.isEmpty()) { %>
    <table>
        <thead>
        <tr>
            <th>Item ID</th>
            <th>Item Name</th>
            <th>Item Description</th>
            <th>Item Type</th>
            <th>Item Price</th>
            <th>Availability</th>
            <th>Edit Item</th>
            <th>Remove Item</th>
        </tr>
        </thead>
        <tbody>
        <% for (Items item : itemsList) { %>
        <tr>
            <td><%= item.getItemId() %></td>
            <td><%= item.getItemName() %></td>
            <td><%= item.getItemDescription() %></td>
            <td><%= item.getItemType() %></td>
            <td><%= item.getItemPrice() %></td>
            <td><%= item.isAvailable() ? "Yes" : "No" %></td>
            <td>
                <form action="/admin/editItem">
                    <input type="hidden" name="id" value="<%=item.getItemId()%>">
                    <input type="submit" value="Edit" class="button">
                </form>
            </td>
            <td>
                <form action="/admin/deleteItem">
                    <input type="hidden" name="id" value="<%=item.getItemId()%>">
                    <input type="submit" value="Delete" class="delete-button">
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <br><br>
    <a href="/admin/add" class="button">Add New Item</a> <br><br>
    <a href="/admin/portal" class="button">Back to Admin Portal</a> <br>
    <% } else { %>
    <p style="text-align: center;">No items are available at the moment.</p> <br>
    <a href="/admin/add" class="button">Add Item</a> <br>
    <a href="/admin/portal" class="button">Back to Admin Portal</a> <br>
    <% } %>
</div>
</body>
</html>
