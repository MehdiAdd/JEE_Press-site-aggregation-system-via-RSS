<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
   
		<link rel="stylesheet" href="css/login.css" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>

    </style>
</head>
<body>
    <div class="conteneur">
       <!--   <div class="gauche"><img  class="svg1" src="css/img/log.png" alt="News"></div>-->
        <div class="droit">

        
			  <form action="${pageContext.request.contextPath}/perform_login"  method="post" class="form" id="form">
				<img src="images/avatar2.png" alt="">
				<h2>Login</h2>
				<c:if test="${param.error != null}">
										
					<div class="alert alert-danger col-xs-offset-1 col-xs-10">
						<h1 style="font-size: 15px;">Invalid username and password.</h1>
					</div>
	
				</c:if>
					
				<!-- Check for logout -->
	
				<c:if test="${param.logout != null}">
								
					<div class="alert alert-success col-xs-offset-1 col-xs-10">
					<h1 style="font-size: 15px; padding: -2px -2px -2px -2px;">You have been logged out.</h1>	
					</div>
				
				</c:if>
				<div class="input-group">
				  <input type="text" name="username" id="username" required>
				  <label for="loginUser">User Name</label>
				</div>
				<div class="input-group">
				  <input type="password" name="password" id="password" required>
				  <label for="loginPassword">Password</label>
				</div>
                <Button type="submit" id="backtologin">Login</Button>
                <Button type="" id="register">Register</Button>
			  </form>
		
			  <script type="text/javascript">
				document.getElementById("register").onclick = function () {
					location.href = "registerPage";
				};
			</script>
			
        </div>
    </div>
</body>
</html>