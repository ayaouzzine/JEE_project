<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  
<!--CODE CSS-->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp"
crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
crossorigin="anonymous">
<!--Fichiers-->

<link rel="stylesheet" href="./ressources/css/style.css">
<link rel="stylesheet" href="./ressources/css/authentification.css">

  <title>Connexion</title>
  
  <style type="text/css">
  	body {
	    background: #E0EEEE;/* linear-gradient(to right, #c04848, #480048); */
	    min-height: 100vh
	}
	
	.text-gray {
	    color: #aaa
	}
  </style>
</head>

<body>

<!-- Menu -->
 <c:if test = "${empty sessionScope.userId}"> <c:redirect url="authentification"></c:redirect></c:if>
<c:import url="clientNav.jsp"/>
<div class="container py-5">
    <div class="row text-center mb-5">
        <div class="col-lg-7 mx-auto">
            <h1>Liste des demandes effectuées</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-10 mx-auto">
            <!-- List group-->
            <ul class="list-group shadow">
                <!-- list group item-->
                <li class="list-group-item">
	                    <!-- Custom content-->
	                    <div class="row mt-0 font-weight-bold mb-2 dislay-4">
	                    	<div class="col-1"><h5>#</h5></div>
	                    	<div class="col-2"><h5>Date Création</h5></div>
	                    	<div class="col">
	                    		<h5 class="text-center"><i class="fas fa-box-open"></i> Détails</h5>
	                    	</div>
	                    	<div class="col-2"><h5>Total</h5></div>
	                    </div>
	                </li>
                <c:forEach items="${demandes}" var="d" varStatus="status">
                	<li class="list-group-item">
	                    <!-- Custom content-->
	                    <div class="row mt-0 font-weight-bold mb-2 dislay-4">
	                    	<div class="col-1"><h5>#<c:out value="${d.demande.id}"/></h5></div>
	                    	<div class="col-2"><h5><c:out value="${d.demande.date_creation}"/></h5></div>
	                    	<div class="col">
	                    		<div class="row  border border-info rounded">
	                    		<c:set var="totalDmd" value="${0}"/>
	                    			<c:forEach items="${d.lds}" var="lc" varStatus="status">
	                    				<div class="col">
	                    					<h5> <c:out value="${lc.carton.libelle_carton}"/> </h5>
	                    					<h5><i class="fa fa-long-arrow-right mr-1 mb-1"></i> Quantité : <c:out value="${lc.cd.nbr}"/></h5>
	                    					<h5><i class="fa fa-long-arrow-right mr-1 mb-1"></i> Prix : <c:out value="${lc.carton.prix} Dhs"/></h5>
	                    				</div>
	                    				<c:set var="totalDmd" value="${totalDmd + lc.cd.nbr * lc.carton.prix}" />
	                    			</c:forEach>
	                    		</div>
	                    	</div>
	                    	<div class="col-2"><h5><c:out value="${totalDmd}"/> Dhs</h5></div>
	                    </div>
	                    <%-- <div class="media align-items-lg-center flex-column flex-lg-row p-3">
	                        <div class="media-body order-2 order-lg-1">
	                            <h5 class="mt-0 font-weight-bold mb-2">Demande #<c:out value="${d.demande.id}"/> Date Création : <c:out value="${d.demande.date_creation}"/></h5>
	                        </div>
	                    </div> --%> <!-- End -->
	                </li>
                </c:forEach>
            </ul> <!-- End -->
        </div>
    </div>
</div>
<script type="text/javascript" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>