<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wind Animation with Car</title>
    <style>
        body {
          margin: 0;
          overflow: hidden;
          background-color: #0E0C0A;
        }

        .car {
          position: absolute;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%); /* Center the car */
          width: 350px; /* Increase car size */
          z-index: 1;
          background: none; /* Remove background */
        }

        .wind-container {
          position: relative;
          width: 100%;
          height: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
          margin-top: 20vh; /* Adjust margin-top to center vertically */
        }

        .wind-line {
          width: 100%;
          height: 3px;
          background: linear-gradient(to right, rgba(255,255,255,0) 50%, rgba(255,255,255,0.8) 50%); /* Create dashed effect */
          background-size: 1cm 3px; /* Set length and thickness of dashes */
          animation: windAnimation 0.1s linear infinite; /* Faster animation */
        }
        .wind-normalline {
         width: 100%;
         height: 3px;
         background: rgba(255,255,255,0.8); /* Solid white */
         animation: windAnimation 0.2s linear infinite;
}
        @keyframes windAnimation {
          0% {
            background-position: 0 0;
          }
          100% {
            background-position: 1cm 0; /* Move dashes to create animation */
          }
        }
        .container {
          width: 600px;
          padding: 20px;
          margin-left:30%;
          margin-top:8%;
          background-color: rgba(255, 255, 255, 0.1);
          border-radius: 10px;
        }
        h1 {
          text-align: center;
          color:white;
        }
        .input-group {
          margin-bottom: 20px;
        }
        .input-group label {
          display: block;
          margin-bottom: 5px;
        }
        .input-group input {
          width: 97%;
          padding: 10px;
          border-radius: 5px;
          border: none;
          margin-right:2%;
        }
        .input-group input:focus {
          outline: none;
        }
        .btn {
          display: block;
          margin: 0 auto;
          padding: 10px 20px;
          background-color: #555;
          color: #fff;
          text-decoration: none;
          border-radius: 5px;
          transition: background-color 0.3s;
        }
        .btn:hover {
          background-color: #333;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Register Vehicle</h1>

    <form action="/opencarmainpage" method="Post">
        <div class="input-group">
            <label for="modelNo">Vehicle Model No:</label>
            <input type="text" id="modelNo" name="modelNo" placeholder="Enter Vehicle Model No" required>
        </div>
        <div class="input-group">
            <label for="vehicleId">Vehicle ID:</label>
            <input type="text" id="vehicleId" name="vehicleId" placeholder="Enter Vehicle ID" required>
        </div>
        <button type="submit" class="btn">Register Vehicle</button>
    </form>
</div>
<div class="wind-container">
    <img src="https://imgur.com/6rJKP1t.png" alt="Car" class="car">
</div>
<div class="wind-normalline"></div>
<br><br>
<div class="wind-line"></div>
<br><br>
<div class="wind-normalline"></div>
</body>
</html>
