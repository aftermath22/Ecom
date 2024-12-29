<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 11/14/2024
  Time: 2:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal</title>
    <style>
        /* CSS Variables for Light & Dark Mode */
        :root {
            --bg-color-light: #f4f4f9;
            --container-bg-light: #fff;
            --text-color-light: #333;
            --button-bg-light: #007bff;
            --button-hover-light: #0056b3;
            --logout-bg-light: #d9534f;

            --bg-color-dark: #181818;
            --container-bg-dark: #333;
            --text-color-dark: #ddd;
            --button-bg-dark: #338cff;
            --button-hover-dark: #0056b3;
            --logout-bg-dark: #c9302c;
        }

        /* General Body Styling */
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
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        /* Dark Mode Styling */
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
            transition: background-color 0.3s ease;
        }

        .dark-mode .container {
            background-color: var(--container-bg-dark);
        }

        h1 {
            color: inherit;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* General link styles - button-like appearance */
        a {
            display: inline-block;
            font-size: 16px;
            color: white;
            text-decoration: none;
            margin: 10px 0;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: var(--button-bg-light);
            transition: all 0.3s ease;
            text-align: center;
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

        /* Logout button */
        input[type="submit"] {
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: var(--logout-bg-light);
            transition: background-color 0.3s ease;
        }

        .dark-mode input[type="submit"] {
            background-color: var(--logout-bg-dark);
        }

        input[type="submit"]:hover {
            background-color: #c9302c;
        }
    </style>
    <script>
        // Function to toggle Dark Mode
        function toggleDarkMode() {
            document.body.classList.toggle('dark-mode');
            const isDarkMode = document.body.classList.contains('dark-mode');
            localStorage.setItem('darkMode', isDarkMode);
        }

        // Set Dark Mode preference on page load
        window.onload = function() {
            const darkMode = localStorage.getItem('darkMode');
            if (darkMode === 'true') {
                document.body.classList.add('dark-mode');
            }
        }
    </script>
</head>
<body>
<!-- Dark Mode Toggle Button -->
<button onclick="toggleDarkMode()" style="position: fixed; top: 20px; right: 20px; padding: 8px 15px; border: none; border-radius: 5px; background-color: #007bff; color: white; cursor: pointer; transition: background-color 0.3s ease;">Toggle Dark Mode</button>

<div class="container">
    <h1>Welcome, ${admin.name}!</h1>
    <a href="/admin/manage">Manage Items</a><br>
    <a href="/admin/users">Manage User</a><br>
    <a href="/admin/blacklist">Manage Black-List</a><br>
    <a href="/admin/edit">Edit Your Profile</a><br>
    <form action="/logout">
        <input type="submit" value="Logout">
    </form>
</div>
</body>
</html>
