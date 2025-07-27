<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Open Autonomous System Dashboard</title>
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

        .login-container {
           max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background :rgb(255 255 255/30%);
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

         .heading {
            color: white;
            font-size: 2em;
            margin-bottom: 20px; 
            margin-left:25%;
            margin-top: 80px;
            -webkit-text-stroke-width: 1px;
            -webkit-text-stroke-color: black;
            margin-right:27%;
            background : #0402a3;
                        
        }
        

        .login-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form-group {
            margin-bottom: 20px;
            width: 100%;
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

        .form-group input:focus {
            border-bottom: 2px solid #8e44ad;
        }

        .login-btn {
            background: green;
            color: white;
            border: none;
            border-radius: 5px;
            height: 40px;
            width: 150px;
            font-size: 16px;
            cursor: pointer;
        }

        .login-btn:hover {
          background: orange;        }
        .signup-link {
        color: #002ef7;
        text-decoration: none;
        margin-top: 10px;
        font-size: 14px;
    }

    .signup-link:hover {
        text-decoration: underline;
    }
    </style>
</head>
<body>
<h2 class="heading">Login to Open Autonomous System Dashboard</h2>
<div class="login-container">
    
    <form class="login-form" action="loginsuccessfull" method="Post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" class="login-btn">Login</button>
    </form>
     <a href="opensignup" class="signup-link">Sign Up</a>
</div>
</body>
</html>