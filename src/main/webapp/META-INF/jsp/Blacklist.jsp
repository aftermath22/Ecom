<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.util.List" %>
<%@ page import="org.keval.ecom.model.Blacklist" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Blacklist</title>

  <!-- CSS with Light/Dark mode -->
  <style>
    /* Define light and dark mode variables */
    :root {
      --background-color-light: #f9f9f9;
      --table-bg-light: #ffffff;
      --header-bg-light: #d9534f;
      --text-color-light: #333;
      --hover-bg-light: #ddd;
      --time-text-light: #555;

      --background-color-dark: #333333;
      --table-bg-dark: #555555;
      --header-bg-dark: #c41f1f;
      --text-color-dark: #ddd;
      --hover-bg-dark: #777777;
      --time-text-dark: #cccccc;
    }

    /* General Page Styles */
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
      background-color: var(--background-color-light);
      color: var(--text-color-light);
      transition: background-color 0.3s ease, color 0.3s ease;
    }

    .dark-mode {
      background-color: var(--background-color-dark);
      color: var(--text-color-dark);
    }

    /* Heading Style */
    h1 {
      text-align: center;
      color: var(--text-color-light);
    }

    .dark-mode h1 {
      color: var(--text-color-dark);
    }

    /* Table Styling */
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

    tr:hover {
      background-color: var(--hover-bg-light);
    }

    .dark-mode tr:hover {
      background-color: var(--hover-bg-dark);
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

    /* Admin Portal Button */
    #portalButton {
      display: inline-block;
      text-decoration: none;
      background-color: #007bff;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      transition: background-color 0.3s ease, transform 0.2s ease;
      cursor: pointer;
      font-size: 16px;
      text-align: center;
    }

    #portalButton:hover {
      background-color: #0056b3;
      transform: scale(1.1);
    }

    #portalButton:active {
      transform: scale(0.9);
    }
  </style>

  <!-- JS for Dark/Light Mode -->
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
<!-- Dark Mode Toggle -->
<div style="text-align: right;">
  <button id="toggleMode" onclick="toggleDarkMode()">Toggle Dark Mode</button>
</div>

<h1>Blacklist</h1>

<%
  List<Blacklist> blacklist = (List<Blacklist>) request.getAttribute("blacklist");
  if (blacklist != null && !blacklist.isEmpty()) {
    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MMM dd, yyyy");
    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("hh:mm a");
    for (Blacklist entry : blacklist) {
      LocalDateTime listOn = entry.getListedOn();
%>
<table>
  <thead>
  <tr>
    <th>Email</th>
    <th>Listed On</th>
    <th>Unban</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td><%= entry.getEmail() %></td>
    <td>
      <span class="date"><%= listOn.format(dateFormatter) %></span><br>
      <span class="time"><%= listOn.format(timeFormatter) %></span>
    </td>
    <td>
      <form action="/admin/unban">
        <input type="hidden" value="<%=entry.getEmail()%>" name="email">
        <input type="submit" value="Unban">
      </form>
    </td>
  </tr>
  </tbody>
</table>
<%
  }
} else {
%>
<h2 style="text-align: center ; color: red">No blacklisted emails</h2>
<%
  }
%>

<!-- Admin Portal Interactive Button -->
<div style="text-align: center; margin: 20px;">
  <a href="/admin/portal" id="portalButton">Go to Admin Portal</a>
</div>
</body>
</html>
