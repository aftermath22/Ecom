<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 11/14/2024
  Time: 3:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Internal Error</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            font-family: 'Arial', sans-serif;
            color: #fff;
            overflow: hidden;
        }
        .error-container {
            text-align: center;
        }
        .error-title {
            font-size: 6rem;
            font-weight: bold;
            margin: 0;
        }
        .error-message {
            font-size: 2rem;
            margin: 10px 0 20px;
            letter-spacing: 1px;
        }
        .error-icon {
            font-size: 10rem;
            margin-bottom: 20px;
            color: rgba(255, 255, 255, 0.8);
        }
        @media (max-width: 768px) {
            .error-title {
                font-size: 4rem;
            }
            .error-message {
                font-size: 1.5rem;
            }
            .error-icon {
                font-size: 8rem;
            }
        }
    </style>
</head>
<body>
<div class="error-container">
    <div class="error-icon">☹</div>
    <div class="error-title">Internal Error</div>
    <div class="error-message">Something went wrong. Please try again later.</div>
</div>
</body>
</html>

