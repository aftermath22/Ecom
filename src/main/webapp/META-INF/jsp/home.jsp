<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('/ecom.jpg'); /* Path to the image */
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #ddd; /* Light gray text for better visibility */
        }

        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.85); /* Translucent white background */
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            width: 300px;
        }

        h1 {
            font-size: 24px;
            color: #222; /* Dark gray for the heading */
            margin-bottom: 20px;
        }

        a {
            display: block;
            font-size: 16px;
            color: #000000;
            text-decoration: none;
            margin: 10px 0;
            padding: 10px 20px;
            border: 1px solid #1e1f22;
            border-radius: 5px;
            background-color: rgba(255, 255, 255, 0.6);
            transition: all 0.3s;
        }

        a:hover {
            background-color: #1e1f22;
            color: white;
            transform: scale(1.05); /* Interactive effect */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to ShopIt</h1>
    <a href="/items">Shop Items</a>
    <a href="/login">Login as a User/Admin</a>
    <a href="/register">Register as a User</a>
</div>
</body>
</html>
