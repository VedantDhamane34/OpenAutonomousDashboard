<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Open Autonomous System Dashboard</title>
    <style>
         body {
            font-family: Arial, sans-serif;
            background-image:url('https://imgur.com/Ngn92x7.png');
            margin: 0;
            padding: 0;            
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-size: cover;
            background-position: center;
        }
        .heading {
            color: white;
            font-size: 2em;
            margin-bottom: 20px;
            margin-left:25%;
            margin-right:24%;
            margin-top: 80px;
            background : #0402a3;
            -webkit-text-stroke-width: 1px;
            -webkit-text-stroke-color: black;
            
        }
        
        .signup-container {
           
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background: rgb(255 255 255/30%);
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        

        }
        .signup-form {
            display: inline-block;
            text-align: left;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 400px;
            height: 40px;
            padding: 5px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            background :rgb(255 255 255/30%);
        }
        .signup-btn {
            background: green;
            color: white;
            border: none;
            border-radius: 5px;
            height: 40px;
            width: 150px;
            font-size: 16px;
            cursor: pointer;
            margin-left:32%;
        }
        .signup-btn:hover {
            background: orange;
        }
    </style>
</head>
<body>
 <h2 class="heading">Sign Up for Open Autonomous System Dashboard</h2>
<div class="signup-container">
   
    <form class="signup-form" action="signupsuccessfull" method="post">
        <div class="form-group">
            <label for="fullname">Full Name:</label>
            <input type="text" id="fullname" name="fullname" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="signup-btn">Sign Up</button>
    </form>
</div>
</body>
</html>
