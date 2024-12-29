<%-- Created by IntelliJ IDEA. --%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Item</title>

    <!-- CSS Variables for Light and Dark Mode -->
    <style>
        :root {
            --bg-color-light: #ffffff;
            --text-color-light: #333333;
            --table-bg-light: #f4f4f4;
            --button-bg-light: #007bff;
            --button-hover-light: #0056b3;
            --error-color-light: #d9534f;
            --success-color-light: #5cb85c;

            --bg-color-dark: #333333;
            --text-color-dark: #dddddd;
            --table-bg-dark: #555555;
            --button-bg-dark: #338cff;
            --button-hover-dark: #0056b3;
            --error-color-dark: #ff5555;
            --success-color-dark: #55ff55;
        }

        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: var(--bg-color-light);
            color: var(--text-color-light);
            margin: 0;
            padding: 0;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .dark-mode {
            background-color: var(--bg-color-dark);
            color: var(--text-color-dark);
        }

        h1 {
            text-align: center;
            margin: 10px 0;
        }

        /* Adjusted form container */
        form {
            max-width: 700px;
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background: var(--table-bg-light);
            transition: background 0.3s ease;
        }

        .dark-mode form {
            background: var(--table-bg-dark);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        tr {
            height: 50px;
        }

        td {
            padding: 8px;
            text-align: left;
        }

        input,
        select,
        button {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        input:focus,
        select:focus,
        button:focus {
            border-color: #007bff;
            outline: none;
        }

        /* Buttons */
        button {
            background-color: var(--button-bg-light);
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: var(--button-hover-light);
        }

        .dark-mode button {
            background-color: var(--button-bg-dark);
        }

        .dark-mode button:hover {
            background-color: var(--button-hover-dark);
        }

        /* Style for Anchor Links as Buttons */
        a {
            display: inline-block;
            color: white;
            background-color: var(--button-bg-light);
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .dark-mode a {
            background-color: var(--button-bg-dark);
        }

        a:hover {
            background-color: var(--button-hover-light);
        }

        .dark-mode a:hover {
            background-color: var(--button-hover-dark);
        }

        /* Error & Success Messages */
        .error {
            color: var(--error-color-light);
        }

        .dark-mode .error {
            color: var(--error-color-dark);
        }

        .success {
            color: var(--success-color-light);
        }

        .dark-mode .success {
            color: var(--success-color-dark);
        }

        /* Responsive design */
        @media (max-width: 768px) {
            input,
            select,
            button {
                font-size: 16px;
            }
        }
    </style>

    <!-- JavaScript for Dark Mode Toggling -->
    <script>
        function toggleDarkMode() {
            document.body.classList.toggle('dark-mode');
            const isDarkMode = document.body.classList.contains('dark-mode');
            localStorage.setItem('darkMode', isDarkMode);
        }

        window.onload = function () {
            const darkMode = localStorage.getItem('darkMode');
            if (darkMode === 'true') {
                document.body.classList.add('dark-mode');
            }
        };
    </script>
</head>
<body>

<!-- Dark Mode Toggle Button -->
<div style="text-align: right;">
    <button id="toggleMode" onclick="toggleDarkMode()">Toggle Dark Mode</button>
</div>

<h1>Add New Item</h1>

<!-- Display Success/Error Message -->
<%
    String message = (String) request.getAttribute("message");
    String error = (String) request.getAttribute("error");
    if (message != null) {
%>
<p class="success"><%= message %></p>
<%
    }
    if (error != null) {
%>
<p class="error"><%= error %></p>
<% } %>

<!-- Form -->
<form action="addItem" method="post">
    <table>
        <tr>
            <td><label for="itemName">Item Name:</label></td>
            <td><input type="text" id="itemName" name="itemName" required /></td>
        </tr>
        <tr>
            <td><label for="itemDescription">Item Description:</label></td>
            <td><input type="text" id="itemDescription" name="itemDescription" /></td>
        </tr>
        <tr>
            <td><label for="itemType">Item Type:</label></td>
            <td><input type="text" id="itemType" name="itemType" /></td>
        </tr>
        <tr>
            <td><label for="itemPrice">Item Price:</label></td>
            <td><input type="number" id="itemPrice" name="itemPrice" required /></td>
        </tr>
        <tr>
            <td><label for="isAvailable">Available:</label></td>
            <td>
                <input type="checkbox" id="isAvailable" name="isAvailable" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <button type="submit">Add Item</button>
            </td>
        </tr>
    </table>
</form>

<br><br>
<a href="/admin/manage">Back to Manage Items</a>
</body>
</html>
