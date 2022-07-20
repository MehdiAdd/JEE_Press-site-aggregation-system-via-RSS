<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> <!-- Autocomplete-->
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!-- Autocomplete-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.devbridge-autocomplete/1.2.27/jquery.autocomplete.min.js"></script>
         
</head>
<body>
	
	<br><br>
         
	<center><h1 style="font: 34px Poppins;"> Rss News aggregator </h1></center>
	

		


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
		<!--   <li>
			  <i class='bx bx-search' ></i>
			  <input type="text" placeholder="Search categories...">
			<span class="tooltip">Search</span>
		  </li>
		<!-- <li>
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
		  </li>--> 
		  <li>
			<a href="/">
			  <i class='bx bx-home' ></i>
			  <span class="links_name">Accueil</span>
			</a>
			<span class="tooltip">Accueil</span>
		  </li>
		  <li>
			<a href="/siteFavoris">
			  <i class="bx bx-heart" ></i>
			  <span class="links_name">Sites Favoris</span>
			</a>
			<span class="tooltip">Sites Favoris</span>
		  </li>
		  <li>
			<a href="/articleALire">
			  <i class='bx bx-time' ></i>
			  <span class="links_name">Lire plus tard</span>
			</a>
			<span class="tooltip">Lire plus tard</span>
		  </li>
		  <li>
			<a href="/tendance">
			  <i class=' bx bx-trending-up' ></i>
			  <span class="links_name">Tendance</span>
			</a>
			<span class="tooltip">Tendance</span>
		  </li>
		<!--  <li>
			<a href="#">
			  <i class='' ></i>
			  <span class="links_name"></span>
			</a>
			<span class="tooltip"></span>
		  </li> -->
	
		</ul>
		<div class="profile_content">
		  <div class="profile">
			<div class="profile_details">
			  <img src="css/img/user.png" alt="">
			  <div class="name_job">
				<div class="name"><c:out value="${username}"/></div>
				<div class="job">Rss news reader</div>
			  </div>
			</div>
			<a  href="/loginPage?logout" alt="Deconnexion">
			<i class='bx bx-log-out' id="log_out" ></i>
			<span class="links_name">Deconnexion</span>
			<span class="tooltip">deconnexion</span>
		    </a>
		  </div>
		</div>
	  </div>
</div>
<div class="">
	<div class="container">	
		<section  id ="sbox" class="box search" style="margin-right:21%; position: sticky; padding-top: 3%; ">
			<form method="GET" action="/home">
	<div class="input-group rounded" >
		<input id="categorie" type="text" name="categorie" class="form-control rounded" placeholder="Search for your best categories" aria-label="Search"
		  aria-describedby="search-addon" size="80" style="margin-left: 35% ;" />
		<span class="input-group-text border-0" id="search-addon" >
		  <i class="fas fa-search" ></i>
		</span>
	  </div>
	</form> 
</section>
<br> <br> <br> <br>
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
									<a  id='<c:out value="${e.getId()}"/>' onclick="message()" class="btn btn-outline-danger btn-sm"><i class="far fa-heart"></i></a></p>
									<span class="date"><span class="month"><c:out value="${e.getPublishedDate().getMonth()}"></c:out><span>/</span></span> <span class="day"><c:out value="${e.getPublishedDate().getDate()}"></c:out>/</span><span class="year">2021</span></span>
									
									<div id="heart" class="alert alert-success" style="display:none;">
										<h1 style="font-size: 10px; padding: -4px -4px -1px -1px;">L'article est ajoute a votre liste lire plus tard</h1>	
										</div> 
										<br><br>
								</div>
			    			</div>
			    		</div>	
						<script>	
						  $('#<c:out value="${e.getId()}"/>').click(function(){
							  
								 
							    $.ajax({
							        url : 'aLire?titre=<c:out value="${e.getTitre()}"/>&link=<c:out value="${e.getLink()}"/>',
							        method : 'GET',
							        async : true,
							        complete : function(data) {
							            console.log(data.responseText);
							        }
							    });
			
							});
				  </script>
						
						
			</c:forEach>
			    	  </div>
		
	  
	  </c:if>
</div>


	</div>



    

	<!-- Pagination -->
<div class="row">
		<div class="col">
        <nav class="pagination text-center">
           <!--   <span class="page-numbers prev inactive">Prev</span>-->
         
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

   <!-- Autocomplete search -->
   <script>
$( function(){
	var Categories = [<c:forEach items="${listCategories}" var="e">   
	"<c:out value="${e.getName()}"/>", </c:forEach>     ]; 

 $("#categorie").autocomplete({
   source: Categories 
});
});
  </script>

  <!-- Heart onclick add to Plustard-->
  <script >
			
	$('#<c:out value="${e.getId()}"/>').click(function(){
		  $.ajax({
			  url : 'aLire?titre=<c:out value="${e.getTitre()}"/>&link=<c:out value="${e.getLink()}"/>',
			  method : 'GET',
			  async : false,
			  complete : function(data) {
				  console.log(data.responseText);
			  }
		  });

	  });
  </script>

  <script>
   function message(){
	
	alert("l'article est bien ajoutée à la secion Lire plus tard :)");
  };
  </script>
   <!-- Sticky search bar --> 
   <script>
	
	window.onscroll = function() {myFunction()};
	
	
	var box = document.getElementById("sbox");
	var sticky = box.offsetTop;
	function myFunction() {
	  if (window.pageYOffset > sticky) {
		box.classList.add("sticky");
	  } else {
		box.classList.remove("sticky");
	  }
	}
	</script>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js"></script>
   
   
		

</body>
</html>