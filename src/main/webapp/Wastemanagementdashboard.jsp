<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Waste Management Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            background-image: url('https://img.freepik.com/premium-vector/workers-are-working-with-garbage-trucks-with-backdrop-buildings_353206-122.jpg');
            background-size: cover;
            background-position: center;
             height: 100vh;
        }

        .container {
    max-width: 400px;
    margin-left: 40%;
    margin-right: 45%;
    margin-top: 100px;
    padding: 20px;

    background: rgba(255, 255, 255, 0.4); /* Adjust the opacity here (0.9 is less transparent) */

    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

        .heading {
            background-color: rgba(255,255,255,0.5);
            margin-right: 36%;
            margin-top: 50px;
            margin-left: 32%;
            color: red;
        }

        .heading:hover {
            color: black;
        }

        .select-container {
            display: inline-block;
            border-radius: 20px;
            overflow: hidden;
            margin-top: 20px;
            background-color: lightblue;
            padding: 5px;
            margin-left:10%;
        }

        select {
            padding: 10px;
            font-size: 16px;
            border: none;
            background-color: transparent;
            cursor: pointer;
            width: 150px;
            border-radius: 20px;
        }

        .action-button button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            margin-left:20%;
            transition: background-color 0.3s;
        }

        .action-button button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

<h1 class="heading">Waste Management Dashboard</h1>

<div class="container">
    <div class="select-container">
        <select id="district">
            <option value="empty"></option>
            <option value="pune">Pune</option>
            <option value="akola">Akola</option>
            <option value="satara">Satara</option>
            <option value="amravati">Amravati</option>
            <option value="mumbai">Mumbai</option>
        </select>
    </div>

     <div class="action-button">
        <form id="openMapForm" method="post">
    <input type="hidden" id="city" name="city" value="">
    <button type="submit">Open Map</button>
</form>

    </div>
</div>


</body>
<script>
document.getElementById("district").addEventListener("change", function() {
    var city = this.value;
    document.getElementById("city").value = city; // Set the value of the hidden input field
    document.getElementById("openMapForm").action = "/openwastemanagementmap?city=" + city;
});

</script>
</html>