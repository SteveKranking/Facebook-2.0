<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Dashboard</title>
		<link rel="stylesheet" type="text/css" href="/css/styles.css">	
		<script src="/js/main.js"></script>
	</head>

	<body>
		<h1>Welcome back, ${ currentUser.firstName }!</h1>
		<a href="/logout">Logout</a>

		<form:form method="POST" action="/newPost" modelAttribute="post">

			<form:label path="contents"> What're you thinking? </form:label>
			<form:input path="contents" />
			
			<input type="submit" value="Submit" />
		</form:form>

		<h2> Timeline </h2>

		<c:forEach items="${postLoop}" var="thisPost">

			<p> <a href="/user/${thisPost.user.id}"> ${thisPost.user.firstName} </a> says: ${thisPost.contents} </p>
			<br />
			<span> <a href="/post/${thisPost.id}/join"> Like! </a> </span> <span> <a href="/post/${thisPost.id}">
					 ${thisPost.likes.size()} people </a> like this!	
					 <c:if test="${thisPost.user.equals(currentUser)}">
						<p> <a href="/post/${thisPost.id}/delete"> Delete Post </a></p>
					 </c:if>
			 </span>
			 <p> _________________________________________________________________________________</p>

		</c:forEach>

	</body>
</html>