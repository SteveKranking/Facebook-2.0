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
        <a href="/logout">Logout</a> <a href="/dashboard"> Dashboard </a>
        
		<h1> ${thisUser.firstName}'s Profile </h1>
        
        <p>Name: ${thisUser.firstName} ${thisUser.lastName} </p>

        <p>Alias: ${thisUser.alias} </p>

        <p>Email: ${thisUser.email} </p>

        <p>__________________________________________________________________________________________</p>

        <p> Total posts: ${thisUser.getTotalPosts()} </p>

        <p> Total number of likes: ${thisUser.getTotalLikes()} </p>


		
	</body>
</html>