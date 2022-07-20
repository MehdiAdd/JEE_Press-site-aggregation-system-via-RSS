
<!DOCTYPE html>
<html>
    <head>
        <title>Feed </title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
    </head>
    <body class="is-preload" style="position: relative;">
         <!-- Sidebar -->
			<div id="sidebar">


				<!-- Logo -->
				<!-- <h1 id="logo"><a href="#">FLUX RSS</a></h1> -->	
					<section id="headerr">
						<header>
							<span class="images avatars"><img src="images/avatar1.jpg" alt="" /></span>
							<h1 id="logoo"><a href="/loginPage?logout"><center><c:out value="${username}"/></center></a></h1>
							<p> <center><b> Active Reader </b></center><br/></p>
							
						</header>
					</section>
		
                     <!-- Search -->
<section class="box search">
  	<form method="get" action="/home">
	<input id="categorie" type="text" class="text" name="categorie" placeholder="Search Categories" />
  	</form> 
</section>
				<!-- Nav -->
					<nav id="nav">
						<ul>
						
                        <!-- ForEach / items list getcategories-->	
							<li><a href="#collapse1" data-bs-toggle="collapse" >Categories</a>
							       <div id="collapse1" class="panel-collapse collapse">
									<ul class="list-group">
									 <c:forEach items="${listCategories}" var="e">
										<li class="list-group-item cc"><a href='/home?categorie=<c:out value="${e.getName()}"/>'><center><c:out value="${e.getName()}"/></center></a></li>
								
										</c:forEach>
									</ul>
							     	</div>
							</li>
							<li><a href="ReadLater.html">A Lire Plus Tard </a></li>
							<li><a href="AddUrl.html">Ajouter un site </a></li>
							
						</ul>
					</nav>

				

				<!-- Text -->
					<section class="box text-style1">
						<div class="inner">
							<p>
								<strong>Aggrregation de contenu avec RSS</strong><a href=""></a> <a href=""></a>
							</p>
						</div>
					</section>

				<!-- Recent Posts -->
					<section class="box recent-posts">
						<header>
							<h2>Recent Posts</h2>
						</header>
						<ul>
							<li><a href="#">Posts d'hier</a></li>
							<li><a href="#">Posts Avant hier</a></li>
							<li><a href="#">Posts La semaine derniere</a></li>
						
						</ul>
					</section>

				<!-- Recent Comments -->
					<section class="box recent-comments">
						<header>
							<h2>Recent Comments</h2>
						</header>
						<ul>
							<li> <a href="#">commentaire</a></li>
							<li> <a href="#">commentaire</a></li>
							<li> <a href="#">commentaire</a></li>
						</ul>
					</section>

				<!-- Calendar -->
					<section class="box calendar">
						<div class="inner">
							<table>
								<caption>July 2021</caption>
								<thead>
									<tr>
										<th scope="col" title="Monday">M</th>
										<th scope="col" title="Tuesday">T</th>
										<th scope="col" title="Wednesday">W</th>
										<th scope="col" title="Thursday">T</th>
										<th scope="col" title="Friday">F</th>
										<th scope="col" title="Saturday">S</th>
										<th scope="col" title="Sunday">S</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4" class="pad"><span>&nbsp;</span></td>
										<td><span>1</span></td>
										<td><span>2</span></td>
										<td><span>3</span></td>
									</tr>
									<tr>
										<td><span>4</span></td>
										<td><span>5</span></td>
										<td><a href="#">6</a></td>
										<td><span>7</span></td>
										<td><span>8</span></td>
										<td><span>9</span></td>
										<td><a href="#">10</a></td>
									</tr>
									<tr>
										<td><span>11</span></td>
										<td><span>12</span></td>
										<td><span>13</span></td>
										<td class="today"><a href="#">14</a></td>
										<td><span>15</span></td>
										<td><span>16</span></td>
										<td><span>17</span></td>
									</tr>
									<tr>
										<td><span>18</span></td>
										<td><span>19</span></td>
										<td><span>20</span></td>
										<td><span>21</span></td>
										<td><span>22</span></td>
										<td><a href="#">23</a></td>
										<td><span>24</span></td>
									</tr>
									<tr>
										<td><a href="#">25</a></td>
										<td><span>26</span></td>
										<td><span>27</span></td>
										<td><span>28</span></td>
										<td class="pad" colspan="3"><span>&nbsp;</span></td>
									</tr>
								</tbody>
							</table>
						</div>
					</section>

				<!-- Copyright -->
					<ul id="copyright">
						<li>&copy; </li><li> <a href="http://html5up.net">MID 2021</a></li>
					</ul>

			</div>
			<script>
				  var Categories = [<c:forEach items="${listCategories}" var="e">   
    	  '<c:out value="${e.getName()}"/>',
    		  </c:forEach>      ];
    
	
				  $('#categorie' ).autocomplete({
					source: Categories 
				});
				  
				  
				  $("#yourButtonId").click(function(){
					    $.ajax({
					        url : 'aLire',
					        method : 'GET',
					        async : false,
					        complete : function(data) {
					            console.log(data.responseText);
					        }
					    });

					});
				</script>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    </body>
</html>