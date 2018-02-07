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
        
		<p> ${thisPost.user.firstName} says: ${thisPost.contents} </p>

        <p>__________________________________________________________________________________________</p>
        
        <table>

            <thead>
                <tr>
                    <c:if test = "${currentUsers.size() == 0}">
                        <td> No one has liked this post </td>
                    </c:if>
                    <c:if test = "${currentUsers.size() > 0}">
                        <td> People who have liked this post </td>
                    </c:if>
                </tr>
            </thead>
                <c:forEach items="${currentUsers}" var="thisUser">
                    <tr>
                        <td> ${thisUser.getFirstName()} ${thisUser.getLastName()} </td>
                    </tr>
                </c:forEach>

            </table>
		
	</body>
</html>