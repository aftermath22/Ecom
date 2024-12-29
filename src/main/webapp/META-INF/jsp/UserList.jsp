<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.List" %>
<%@ page import="org.keval.ecom.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>

    <!-- CSS for Light/Dark Modes -->
    <style>
        :root {
            /* Light Mode Colors */
            --bg-color-light: #f9f9f9;
            --table-bg-light: #ffffff;
            --header-bg-light: #4CAF50;
            --text-color-light: #333333;
            --row-hover-light: #ddd;
            --time-text-light: #555555;

            /* Dark Mode Colors */
            --bg-color-dark: #333333;
            --table-bg-dark: #555555;
            --header-bg-dark: #006400;
            --text-color-dark: #dddddd;
            --row-hover-dark: #777777;
            --time-text-dark: #cccccc;
        }

        /* General Body Style */
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: var(--bg-color-light);
            color: var(--text-color-light);
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .dark-mode {
            background-color: var(--bg-color-dark);
            color: var(--text-color-dark);
        }

        /* Adjust Header Style */
        h1 {
            color: var(--text-color-light);
            text-align: center;
        }

        .dark-mode h1 {
            color: var(--text-color-dark);
        }

        /* Table Styles */
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            background-color: var(--table-bg-light);
            transition: background-color 0.3s ease;
        }

        .dark-mode table {
            background-color: var(--table-bg-dark);
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: var(--header-bg-light);
            color: white;
        }

        .dark-mode th {
            background-color: var(--header-bg-dark);
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: var(--row-hover-light);
        }

        .dark-mode tr:hover {
            background-color: var(--row-hover-dark);
        }

        /* Style the time text in the created date section */
        .time {
            color: var(--time-text-light);
            font-style: italic;
            font-size: 14px;
        }

        .dark-mode .time {
            color: var(--time-text-dark);
        }

        /* Dark Mode Toggle */
        #toggleMode {
            cursor: pointer;
            padding: 8px 15px;
            background: var(--header-bg-light);
            border: none;
            border-radius: 5px;
            color: white;
            transition: background 0.3s ease;
        }

        .dark-mode #toggleMode {
            background: var(--header-bg-dark);
        }
    </style>

    <!-- JavaScript for Dark Mode Toggle -->
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

<h1>User List</h1>

<table>
    <thead>
    <tr>
        <th>C_ID</th>
        <th>Created At</th>
        <th>Email</th>
        <th>Name</th>
        <th>Ban User</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Customer> users = (List<Customer>) request.getAttribute("users");
        if (users != null && !users.isEmpty()) {
            DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MMM dd, yyyy");
            DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("hh:mm a");
            for (Customer user : users) {
                LocalDateTime createdAt = user.getCreatedAt();
    %>
    <tr>
        <td><%= user.getCid() %></td>
        <td>
            <span><%= createdAt.format(dateFormatter) %></span><br>
            <span class="time"><%= createdAt.format(timeFormatter) %></span>
        </td>
        <td><%= user.getEmail() %></td>
        <td><%= user.getName() %></td>
        <td>
            <form action="/admin/ban" method="get">
                <input type="hidden" value="<%=user.getEmail()%>" name="email">
                <input type="submit" value="BAN">
            </form>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="5">No users available</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<a href="/admin/portal" style="  color: red ; border: solid ; border-color: blue ; padding: 5px">Back to Admin Portal</a> <br>
</body>
</html>
