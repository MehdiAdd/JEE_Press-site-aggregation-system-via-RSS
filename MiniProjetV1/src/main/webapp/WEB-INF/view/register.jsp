<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>

<html>
<head>
    <title>RSS Aggrregation-Authentification</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
   
    <link rel="stylesheet" href="css/login.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body class="is-preload">
    
        <div class="login-wrapper">
          <form action="${pageContext.request.contextPath}/perform_login"  method="post" class="form" id="form">
        <!--    <img src="images/avatar2.png" alt=""> -->
            <h2>Register</h2>
            <div id="try">
                <small> </small>
            </div>
            <!-- JSTL TESTS -->
            <div class="input-group">
              <input id="username" type="text" name="loginUser" id="loginUser" required>
              <label for="loginUser">User Name</label>
              <small> err</small>
            </div>
            <div class="input-group">
              <input id="loginPassword" type="password" name="loginPassword"  required>
              <label for="loginPassword">Password</label>
              <small> Erreur </small>
            </div>
            <div class="input-group">
              <input id="password2" type="password" name="loginPassword"  required>
              <label for="loginPassword">Confirm Password</label>
              <small style="font-size: 20px;"> Erreur </small>
            </div>
            <!-- <input id="backtologin" type="" value="Login" > -->
           <Button type="" id="backtologin">Login</Button>
           <Button type="submit" id="register">Register</Button>
          </form>
          <script type="text/javascript">
            document.getElementById("backtologin").onclick = function () {
                location.href = "login.html"
             }  
        </script>

    <!-- Scripts -->
    <script src="js/validationform.js"></script>
       

</body>
</html>