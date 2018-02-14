<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Dashboard</title>
		<link rel="stylesheet" type="text/css" href="/css/style.css">
		<link rel="stylesheet"  href="/css/bootstrap.min.css">
		<script src="/js/main.js"></script>
		<script src="/js/bootstrap.min.js"></script>
	</head>

	<body>

		<nav class="navbar navbar-expand-lg navbar-custom bg-custom">
			<a href="#" class="navbar-brand"> Bacefook </a>
		</nav>

		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1 class="display-1"> Bacefook </h1>
				<p class="lead"> Bacebook is where your parents go to try to stalk your friendships and social life </p>
			</div>
		</div>

		<section class="more-space"></section>
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="card-text-center">
						<div class="card-header">
							Login
						</div>
						<div class="card-body">

							<form method="POST" class="form-horizontal" action="/login">
							<p class="card-text">
								<label for="email">Email</label>
								<input id="email" name="email"/>
								
							</p>
							<p class="card-text">
								<label for="password">Password</label>
								<input type="password" id="password" name="password"/>
							</p>
							<input type="submit" value="Login!"/>
							</form>
							
						</div>


						</div>
					</div>

				<div class="col-lg-6">
					<div class="card-text-center">
							<div class="card-header">
								Register
							</div>
							<div class="card-body">
								<form:form method="POST" class="form-horizontal" action="/register" modelAttribute="user">
								<p class="card-text">
								<form:label path="alias"> Username:</form:label>
								<form:input path="alias"/>
								<form:errors path="alias"></form:errors>
								</p>
								<p class="card-text">
								<form:label path="firstName">First Name:
								<form:errors path="firstName"></form:errors>
								</form:label>
								<form:input path="firstName"/>
								</p>
								<p class="card-text">
								<form:label path="lastName">Last Name:</form:label>
								<form:errors path="lastName"></form:errors>
								<form:input path="lastName"/>
								</p>
								<p class="card-text">
								<form:label path="email">Email:
								<form:errors path="Email"></form:errors>
								</form:label>
								<form:input path="email"/>
								</p>
								<p class="card-text">
								<form:label path="password">Password:
								<form:errors path="password"></form:errors>
								</form:label>

								<form:password path="password"/>
								</p>
								<p class="card-text">
								<form:label path="confirm">Password Confirmation:</form:label>
								<form:password path="confirm"/>
								<form:errors path="confirm"></form:errors>
								</p>

								<p class="card-text"><form:errors path="user.*"/></p>
								<input type="submit" value="Register!"/>
								</form:form>

							</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	</body>
</html>