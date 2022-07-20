<!-- %@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
-->
<!DOCTYPE html>
<html>
	<head>
		<title>RSS Aggrregation-Authentification</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/login.css" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	</head>
	<body class="is-preload">
		
			<div class="login-wrapper">
								
			<c:url var="loginUrl" value="/login" />
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
				<input id="login" type="submit" value="Login" >
				<a href="registerPage"><Button id="register" >Register</Button></a>
			  </form>
			  <script type="text/javascript">
				document.getElementById("register").onclick = function () {
					location.href = "registerPage";
				};
			</script>

			  
			</div>
		 

			<!-- JSTL LOGIN -->
			

		
              

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

	</body>
	
</html>