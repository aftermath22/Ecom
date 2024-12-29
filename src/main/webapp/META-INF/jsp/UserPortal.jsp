<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 11/14/2024
  Time: 2:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UserPortal</title>
    <style>
        :root {
            --bg-color-light: #f4f4f9;
            --text-color-light: #333;
            --container-bg-light: #fff;
            --link-color-light: #007bff;
            --button-bg-light: #d9534f;

            --bg-color-dark: #181818;
            --text-color-dark: #ddd;
            --container-bg-dark: #333;
            --link-color-dark: #66aaff;
            --button-bg-dark: #c9302c;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: var(--bg-color-light);
            color: var(--text-color-light);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            transition: background-color 0.3s, color 0.3s;
        }

        .dark-mode {
            background-color: var(--bg-color-dark);
            color: var(--text-color-dark);
        }

        .container {
            text-align: center;
            background-color: var(--container-bg-light);
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
            transition: background-color 0.3s;
        }

        .dark-mode .container {
            background-color: var(--container-bg-dark);
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            font-size: 16px;
            color: var(--link-color-light);
            text-decoration: none;
            margin: 10px 0;
            padding: 10px 20px;
            border: 1px solid var(--link-color-light);
            border-radius: 5px;
            transition: all 0.3s;
        }

        .dark-mode a {
            color: var(--link-color-dark);
            border-color: var(--link-color-dark);
        }

        a:hover {
            background-color: var(--link-color-light);
            color: white;
        }

        .dark-mode a:hover {
            background-color: var(--link-color-dark);
        }

        form {
            margin-top: 20px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: var(--button-bg-light);
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .dark-mode input[type="submit"] {
            background-color: var(--button-bg-dark);
        }

        input[type="submit"]:hover {
            background-color: #c9302c;
        }

        .dark-mode input[type="submit"]:hover {
            background-color: #a32824;
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
            background-color: var(--link-color-light);
            color: white;
            transition: all 0.3s;
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

<div class="container">
    <h1>Welcome, ${customer.name}</h1>
    <a href="/user/cart">View Your Cart</a>
    <a href="/items">Shop Items</a>
    <a href="/user/edit">Edit Your Profile</a>
    <form action="/logout">
        <input type="submit" value="Logout">
    </form>
</div>
</body>
</html>
