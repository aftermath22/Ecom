<%@ page import="org.keval.ecom.model.Items" %>
<%@ page import="java.util.List" %>
<%@ page import="org.keval.ecom.model.Customer" %>
<%@ page import="org.keval.ecom.service.CustomerService" %>
<%@ page import="java.security.Principal" %>
<%@ page import="org.hibernate.Session" %>

<%
    // Retrieve the list of items from the HttpSession
    List<Items> itemsList = (List<Items>) session.getAttribute("items");
    if (itemsList != null && !itemsList.isEmpty()) {
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Items</title>
    <style>
        :root {
            --bg-color-light: #f4f4f9;
            --text-color-light: #333;
            --table-bg-light: #ffffff;
            --table-hover-light: #ddd;

            --bg-color-dark: #181818;
            --text-color-dark: #ddd;
            --table-bg-dark: #333;
            --table-hover-dark: #444;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: var(--bg-color-light);
            color: var(--text-color-light);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            transition: background-color 0.3s, color 0.3s;
        }

        .dark-mode {
            background-color: var(--bg-color-dark);
            color: var(--text-color-dark);
        }

        h1 {
            text-align: center;
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
            background-color: #007bff;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: var(--table-hover-light);
        }

        .dark-mode tr:hover {
            background-color: var(--table-hover-dark);
        }

        .buttons {
            text-align: center;
            margin-top: 20px;
        }

        a.button {
            text-decoration: none;
            padding: 10px 20px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            margin: 5px;
            font-size: 16px;
            transition: all 0.3s;
        }

        a.button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        #toggle-dark-mode {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            transition: all 0.3s;
        }

        #toggle-dark-mode:hover {
            background-color: #0056b3;
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

<div>
    <h1>Item List</h1>

    <table>
        <thead>
        <tr>
            <th>Item ID</th>
            <th>Item Name</th>
            <th>Item Description</th>
            <th>Item Type</th>
            <th>Item Price</th>
            <th>Available</th>
            <th>Add To Cart</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Items item : itemsList) {
        %>
        <tr>
            <td><%= item.getItemId() %></td>
            <td><%= item.getItemName() %></td>
            <td><%= item.getItemDescription() %></td>
            <td><%= item.getItemType() %></td>
            <td><%= item.getItemPrice() %></td>
            <td><%= item.isAvailable() ? "Yes" : "No" %></td>
            <td>
                <%
                    if(item.isAvailable()){
                %>
                <form action="user/buyItem" method="post">
                    <input type="number" required min="1" name="quantity">
                    <input type="hidden" value="<%=item.getItemId()%>" name="itId">
                    <input type="submit" value="Add">
                </form>
                <%
                }else{
                %>
                Not Available
                <%}%>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <div class="buttons">
        <a href="/user/cart" class="button">View Your Cart</a>
        <a href="/user/portal" class="button">Back to User Portal</a>
    </div>
</div>
</body>
</html>

<%
} else {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>No Items</title>
</head>
<body>
<div>
    <h1>No Items Available</h1>
</div>
</body>
</html>
<%
    }
%>
