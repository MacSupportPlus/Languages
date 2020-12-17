<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<title>Languages</title>
</head>
<body>
<div class="container">
	<h1>Languages</h1>
	<div class= "row mt-5">
		<div class="col-sm-8">
			<table class="table table-striped">
				<tr>
					<th>Name</th>
					<th>Creator</th>
					<th>Version</th>
					<th>Action</th>
				</tr>
					<c:forEach items="${languages}" var="lan">
						<tr>
						<td><a href="/languages/${lan.id}">${lan.name}</a></td>
						<td>${lan.creator}</td>
						<td>${lan.version}</td>
						<td>
							<a href="/languages/edit/${lan.id}">Edit</a>
							
								<form action="/languages/${lan.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<button>Delete</button>
								</form>
						</td>
						</tr>
					</c:forEach>
			</table>
		</div>
		
	
		<div class="col-sm-4">
		<form:form action="/languages/create" method="post" modelAttribute="newLanguage">
			<form action="/languages/create" method="post">
				<div class= "form-group">
					<label>Name:</label>
					<form:input path="name" class="form-control"/>
					<form:errors path="name" class="text-danger"/>
				</div>
				<div class= "form-group">
					<label>Creator:</label>
					<form:input path="creator" class="form-control"/>
					<form:errors path="creator" class="text-danger"/>
				</div>
					<div class= "form-group">
					<label>Version:</label>
					<form:input path="version" class="form-control"/>
				</div>
					<input type="submit" value="Add Language" class="btn btn-dark" />
			</form>
		</form:form>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	</div>
</body>
</html>