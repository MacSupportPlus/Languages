<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Language individual Page</title>
</head>
<body>
	<a href="/languages">Dashboard</a>
	<div class="container">
		<div class="card">
  			<div class="card-body">
    			<h4 class="card-title"><c:out value= "${singleLanguage.name}" /></h4>
    			<h6 class="card-subtitle mb-2 text-muted"><c:out value="${singleLanguage.version}" /> </h6>
    			<p class="card-text">
      				<label><c:out value="${singleLanguage.creator}"/></label>
      			</p>
    			<a href="/languages//edit/${singleLanguage.id}" class="card-link">Edit</a>
    			<a href="/languages/${singleLanguage.id}" class="card-link">Delete</a>
  			</div>

		</div>
	</div>

</body>
</html>