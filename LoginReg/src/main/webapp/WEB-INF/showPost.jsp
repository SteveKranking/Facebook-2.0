<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title> Show Profile </title>
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

        <div class="container">
        <div class="copl-lg-12">
        
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
        </div>
        </div>
	</body>
</html>