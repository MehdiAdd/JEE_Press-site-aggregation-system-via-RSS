 <%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
  <%@ page import="com.mdad.model.Item"%>
     <%@ page import="com.mdad.model.Flux"%>
     <%@ page import="com.sun.syndication.feed.synd.SyndCategoryImpl" %>
     
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
	<link rel="stylesheet" href="css/side.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
</head>
<body>
	
	<br><br>
         
	<center><h1> Rss News aggregator </h1></center>
	

	<div class="row">


<div class="">
	<div class="sidebar">
		<div class="logo_content">
		  <div class="logo">
			<i class='bx bxl'></i>
			<div class="logo_name">RSS News</div>
		  </div>
		  <i class='bx bx-menu' id="btn" ></i>
		</div>
		<ul class="nav_list">
		  <li>
			  <i class='bx bx-search' ></i>
			  <input type="text" placeholder="Search categories...">
			<span class="tooltip">Search</span>
		  </li>
		  <li>
			<a href="#collapse1">
			  <i class='bx bx-grid-alt' ></i>
			  <span class="links_name">categories</span>
			  <div id="collapse1" class="panel-collapse collapse">
				<ul class="list-group">
					<li class="list-group-item cc"><a href="#"><center>Politique</center></a></li>
					<li class="list-group-item cc"><a href="#"><center>Sport</center></a></li>
					<li class="list-group-item cc"><a href="#"><center>Art</center></a></li>
					<li class="list-group-item cc"><a href="#"><center>Divertissement</center></a></li>
					
				</ul>
				 </div>
			</a>
			<span class="tooltip">categories</span>
		  </li>
		  <li>
			<a href="AjouterSite.html">
			  <i class='bx bx-user' ></i>
			  <span class="links_name">Ajouter Site</span>
			</a>
			<span class="tooltip">Ajouter Site</span>
		  </li>
		  <li>
			<a href="#">
			  <i class="fa fa-star-o" ></i>
			  <span class="links_name">Favoris</span>
			</a>
			<span class="tooltip">favoris</span>
		  </li>
		  <li>
			<a href="PlusTard.html">
			  <i class='bx bx-pie-chart-alt-2' ></i>
			  <span class="links_name">Lire plus tard</span>
			</a>
			<span class="tooltip">Lire plus tard</span>
		  </li>
		  <li>
			<a href="tendence.html">
			  <i class='bx bx-folder' ></i>
			  <span class="links_name">tendence</span>
			</a>
			<span class="tooltip">tendence</span>
		  </li>
		  <li>
			<a href="#">
			  <i class='bx bx-cart-alt' ></i>
			  <span class="links_name">Order</span>
			</a>
			<span class="tooltip">Order</span>
		  </li>
		  <li>
			<a href="#">
			  <i class='bx bx-heart' ></i>
			  <span class="links_name">Saved</span>
			</a>
			<span class="tooltip">Saved</span>
		  </li>
		  <li>
			<a href="#">
			  <i class='bx bx-cog' ></i>
			  <span class="links_name">Setting</span>
			</a>
			<span class="tooltip">Setting</span>
		  </li>
		</ul>
		<div class="profile_content">
		  <div class="profile">
			<div class="profile_details">
			  <!--<img src="profile.jpg" alt="">-->
			  <div class="name_job">
				<div class="name">Prem Shahi</div>
				<div class="job">Web Designer</div>
			  </div>
			</div>
			<i class='bx bx-log-out' id="log_out" ></i>
		  </div>
		</div>
	  </div>
</div>
<div class="">
	<div class="container">	
		<c:if test="${totalPages!=null}">
              
    	<div class="row" data-masonry='{"percentPosition": true }'>
	          <c:forEach items="${listItems}" var="e">
    		<div class="col-lg-4 col-md-6 col-6">
    			<div class="card">
    				<!--   <img class="card-img-top card-v" alt="">-->
    				<div class="card-body">
    					<h3 class="card-title"><c:out value="${e.getTitre()}"/></h3>
						<p><i>Auteur : <c:out value="${e.getAuteur()}"/> </i></p>
    				  <c:out value="${e.getDescription()}" escapeXml="false"></c:out>
    				
						<p><a href='<c:out value="${e.getLink()}"/>' class="btn btn-outline-success btn-sm">Read More</a>
						<a  id='<c:out value="${e.getId()}"/>' class="btn btn-outline-danger btn-sm"><i class="far fa-heart"></i></a></p>
						<span class="date"><span class="month"><c:out value="${e.getPublishedDate().getMonth()}"></c:out><span>/</span></span> <span class="day"><c:out value="${e.getPublishedDate().getDate()}"></c:out>/</span><span class="year"><c:out value="${e.getPublishedDate().getYear()}"></c:out></span></span>
    				</div>
    			</div>
    		</div>	
			
			
			
</c:forEach>
    	  </div>
		
	  
	  </c:if>
    </div>
</div>


	</div>



    

	<!-- Pagination -->
	<div class="row">
		<div class="col">
        <nav class="pagination text-center">
           <!--   <span class="page-numbers prev inactive">Prev</span>-->
            <span class="page-numbers current">1</span>
			<c:forEach var="i" begin="0" end="${totalPages}" step="1">
				<span class="page-numbers current"><a href='/home?page=<c:out value="${i}"/>' class="active"><c:out value="${i}"/></a></span>
			 </c:forEach>
            <!--    <a href="#" class="page-numbers next">Next</a>-->
       </nav>
	</div>

	

<script>
	let btn = document.querySelector("#btn");
	let sidebar = document.querySelector(".sidebar");
	let searchBtn = document.querySelector(".bx-search");
    let container = document.querySelector(".container");
	btn.onclick = function() {
	  sidebar.classList.toggle("active");
     if(container.style.paddingLeft === "175px")
	 container.style.paddingLeft = "0px";
	 else container.style.paddingLeft = "175px";
	}
	
	searchBtn.onclick = function() {
	  sidebar.classList.toggle("active");
	 
	}
   </script>
    <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js"></script>
   


</body>
</html>