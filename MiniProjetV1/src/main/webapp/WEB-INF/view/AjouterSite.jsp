 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
         
	<center><h1> </h1></center>
	

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
			<a href="#">
			  <i class='bx bx-grid-alt' ></i>
			  <span class="links_name">categories</span>
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
        <c:if test="${error != null}">
                                    
            <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                <h1 style="font-size: 15px;">le site n'est pas operationnel.</h1>
            </div>

        </c:if>
            
        <!-- Check for logout -->

        <c:if test="${confirm != null}">
                        
            <div class="alert alert-success col-xs-offset-1 col-xs-10">
            <h1 style="font-size: 15px; padding: -2px -2px -2px -2px;">le site est bien ajoute.</h1>	
            </div>
        
        </c:if>                
        
    <form class="boxurl" action="addrss" method="post">
        <!-- Site : 	<input type="text" id="inputId" placeholder="Nom du Site"/> <br> <hr> -->
        <label >URL</label>
            <input type="text" id="inputId" name="url" placeholder="URL" size="100" /><br> <hr> 
        
        <button  onclick="addItem()" type="submit">Ajouter URL</button>

        
    </form>


<br> <br>  <br> <br> <br>
        <center><h1>Vos sites Favoris :</h1></center>
        <br><br> <br>
<c:if test="${supprime != null}">
                        
            <div class="alert alert-success col-xs-offset-1 col-xs-10">
            <h1 style="font-size: 15px; padding: -2px -2px -2px -2px;">le site est supprime.</h1>	
            </div>
        
        </c:if>  

      
                <table class="table">
                    <thead style="position: sticky;top: 0" class="thead-dark">
                        <tr>
                            <th class="header" scope="col">Nom du site</th>
                            
                            <th class="header" scope="col">URL</th>
        
                            <th class="header" scope="col">Choix</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listUrls}" var="url">
                        <tr>
                            
                            <td><a href='<c:out value="${url.getUrl() }"/>'><c:out value="${url.getUrl() }"/></a></td>
                            <td></td>
                            <td><a href='remSiteRss?idArticle=<c:out value="${url.getId() }"/>'><button type="button" class="btn btn-danger">Supprimer</button></a></td>
                           
                        </tr>
                       </c:forEach>
               
                        <tr id="dynamic-list"></tr>
                    </tbody>
                </table>

          
      

	</div>

</div>


</div>

<style>
    .boxurl{
	display:flex;
	align-items: stretch;
	height: 40px;
	justify-content: space-between;
	}
	.boxurl label{
		padding-top: 10px;
		padding-right: 35px;
		font-family:-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
	}
	.boxurl button { 
		width: 200px;
		border-radius: 10px;
		border:none;
	}
</style>
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
</body>