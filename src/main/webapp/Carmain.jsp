<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Car Main Dashboard</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      background-color:black;
      color: #fff;
    }
    .container {
      max-width: 800px;
      margin-top:  8%;
      margin-left:  23%;

      padding: 20px;
      background-color: rgba(255, 255, 255, 0.2);

    }
    .status-container {
      background-color: rgba(255, 255, 255, 0.1);
      padding: 20px;
      border-radius: 10px;
      margin-bottom: 20px;
    }
    .status-item {
      margin-bottom: 15px;
    }
    .button {
      display: inline-block;
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      text-align: center;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s;
    }
    .button:hover {
      background-color: #45a049;
    }
    <img src="image-removebg-preview (1).png" height="415" width="601"/></style>
</head>
<body>
<div class="container">
  <div class="status-container">
    <div class="status-item">
      <h2>Charging Status</h2>
      <p>Charging...</p> <!-- Change this dynamically -->
    </div>
    <div class="status-item">
      <h2>Parked Status</h2>
      <p>Location: Parking Lot XYZ</p> <!-- Change this dynamically -->
    </div>
    <div class="status-item">
      <h2>Climate</h2>
      <p>Climate Control: On</p> <!-- Change this dynamically -->
    </div>
    <div class="status-item">
      <h2>Battery Percentage</h2>
      <p>85%</p> <!-- Change this dynamically -->
    </div>
  </div>
  <a href="/openstats" class="button">Check Charging & Fueling Stats</a>
</div>
</body>
</html>
    