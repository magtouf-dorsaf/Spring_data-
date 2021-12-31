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
<h3>Home page : Liste des departements</h3>
</cenetr>
<table class="table ">
	<thead>
		<tr>
			<th> Id</th>
			<th> Nom</th>
			<th> Liste des Projets</th>
			<th> Liste des Employees</th>
		</tr>
	</thead class="thead-black">
	<tbody>
		<c:forEach items="${liste}" var="d">
			<tr>
				<td> ${d.id}</td>
				<td> ${d.nom}</td>
				<td><a class="btn btn-info" href="${cxt}/departement/${d.id}/projet">Consulter les projets</a></td>
				<td><a class="btn btn-info" href="${cxt}/employe/departement/${d.id}">Consulter les Employés</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<center>
	<a href="${cxt}/ajoutPj">Ajouter un projet</a><br>
	<a href="${cxt}/ajoutEmp">Ajouter un employe</a>
</center>
</body>
</html>