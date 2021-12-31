<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<c:set var="cxt" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</head>
<body>
<center>
	<h1>Ajouter projet</h1>
</center>		
	<!-- l'action hatha bch ymchi ylawej 3l mapping saveProduit -->
						<!-- l p hathi lezem tkoun mwjouda fl meth l fiha getmapping -->
	<form:form method="POST" action="saveProjet" modelAttribute="p">
	<div class="form-group">
						<!-- L path hathi t3tini quelle champs je veut selectionner dans cet obj -->
		<h3>titre:<form:input path="titre" class="form-control" aria-describedby="titre"/></h3>
		<h3>Departement: <form:select items="${ld}" path="departement.id" itemValue="id" itemLabel="nom" class="form-control form-control-lg"></form:select></h3>
		<h3>etat:
			<form:select class="custom-select"  path="etat">
				<option value="en cour">en cour</option>
				<option value="probleme">en arret</option>
				<option value="terminee">terminee</option>	
			</form:select>
		</h3>
    </div>
    <center>
		<input type="submit" value="Ajouter" class="btn btn-primary">
	</center>
	</form:form>

</body>
</html>