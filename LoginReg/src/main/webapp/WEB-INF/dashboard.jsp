<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<div class="container">
		<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<title>Dashboard</title>
				<link rel="stylesheet" type="text/css" href="/css/styles.css">
				<link rel="stylesheet"  href="/css/bootstrap.min.css">
				<script src="/js/main.js"></script>
				<script src="/js/bootstrap.min.js"></script>
			</head>
		
			<body>
				<nav class="navbar navbar-expand-lg navbar-custom bg-custom">
					<a href="/dashboard" class="navbar-brand"> Bacefook </a>

					<ul class="navbar-nav">
							<li class="nav-item">
								<a href="/user/${currentUser.id}" class="nav-link"> Profile </a>
							</li>
							<li class="nav-item">
								<a href="/logout" class="nav-link"> Logout </a>
							</li>
					</ul>

					<form action="" class="form-inline">
						<input type="seach" class="form-control" placeholder="Search">
						<button class="btn btn-success" type="submit"> Search </button>					
					</form>
				</nav>
			
			<div class="col-lg-12">

				<h1>You are signed in as, ${ currentUser.alias } </h1>

				<form:form method="POST" action="/newPost" modelAttribute="post">

					<form:label path="contents"> What're you thinking? </form:label>
					<form:input path="contents" />
					
					<input type="submit" value="Submit" />
				</form:form>

				<h2> Timeline </h2>

				<c:forEach items="${postLoop}" var="thisPost">
				
				<div class="container">
				<div class="card">
						<ul class="list-group list-group-flush">
							<li class="list-group-item">

								<div class="card-title">
									<p> <a href="/user/${thisPost.user.id}"> ${thisPost.user.firstName}: </a> </p>
								</div>
								
								<div class="card-body">
								
									<div class="card-text">
										<p> ${thisPost.contents} </p>
									</div>
									
										<c:choose>
												<c:when test="${thisPost.isLiked() == true}">
													<span> <a href="/post/${thisPost.id}/unjoin"> Unlike </a> </span>						</c:when>
												<c:otherwise>
													<span class="badge"> <a href="/post/${thisPost.id}/join"> Like! </a> </span>
												</c:otherwise>
										</c:choose>	
												
									
										<span> <a href="/post/${thisPost.id}">
											
											${thisPost.likes.size()} people </a> like this!	

												<c:if test="${thisPost.user.equals(currentUser)}">
													<p> <a href="/post/${thisPost.id}/delete"> Delete Post </a></p>
												</c:if>
										</span>
								</div>
							</li>
					</ul>	
				</div>
				</div>

				</c:forEach>
			</div>
		</div>
	</body>
</html>