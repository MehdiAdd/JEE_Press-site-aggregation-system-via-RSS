 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE HTML>

<html>
	<head>
		<title>Striped by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
       

        
        
	</head>
	<body class="is-preload">
        <%@include file="sidebar.jsp" %>

        

		<!-- Content -->
			<div id="content">
                
				<center><h1>Article  a lire plus tard </h1></center>
		
				<c:if test="${supprime != null}">
								
					<div class="alert alert-success col-xs-offset-1 col-xs-10">
					<h1 style="font-size: 15px; padding: -2px -2px -2px -2px;">l'article est supprimee.</h1>	
					</div>
				
				</c:if>  
                <table class="table">
                    <thead style="position: sticky;top: 0" class="thead-dark">
                        <tr>
                            <th class="header" scope="col">Titre de l'article </th>
                            
                            <th class="header" scope="col">URL</th>

                            <th class="header" scope="col">Choix</th>
                            
                        </tr>
                    </thead>
                    <tbody>
						<c:forEach items="${listUrls}" var="article">
							<tr>
								<td><c:out value="${article.getTitre() }"/></td>
								
								<td><a href='<c:out value="${article.getLink() }"/>'><button type="button" class="btn btn-info">Lien</button></a></td>
								
								<td><a href='remAlire?idArticle=<c:out value="${article.getId() }"/>'><button type="button" class="btn btn-danger">Supprimer</button></a></td>
							   
							</tr>
						   </c:forEach>
                        
                    </tbody>
                </table>
              


			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

	</body>
</html>