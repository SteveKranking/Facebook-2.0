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
        
        <br />
        <br />

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p class="lead"> Already have an account or need to create one? Click here to sign in/register <a href="/register"> Here!!! </a> </p>
                </div>
            </div>
        </div>

        <section class="more-space">
        <div class="container">
            <div class="row">
                <div class="carousel">
                    <div class="col-lg-12">
                        <div class="carouselExample" class="carousel slide">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExample" data-slide-to="0" class="active"> </li>
                                <li data-target="#carouselExample" data-slide-to="1"> </li>
                                <li data-target="#carouselExample" data-slide-to="2"> </li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="w-100" src="https://images.unsplash.com/photo-1503127241807-fdc42d3acb95?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=fe30b25113f3c8a067b613858496f7e9&auto=format&fit=crop&w=750&q=80" alt="pic">
                                    <div class="carousel-caption">
                                        <h3> Give the illusion your life is perfect </h3>
                                        <p> Make your kid who just ate glue look like the next Einstein to all your friends </p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="w-100" src="https://images.unsplash.com/photo-1485823040952-99ef05fe1637?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a5bad233da611763e3e30b5299190ba6&auto=format&fit=crop&w=890&q=80" alt="pic">
                                    <div class="carousel-caption">
                                        <h3> Get angry about things</h3> 
                                        <p> Publicly argue with your relatives </p>    
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="w-100" src="https://images.unsplash.com/photo-1472393365320-db77a5abbecc?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=05db3d0c50e32c534b4498476453cdd7&auto=format&fit=crop&w=750&q=80" alt="pic">
                                    <div class="carousel-caption">
                                        <h3> Share pictures of your food! </h3>
                                        <p> Absorb all the nutrients through your camera lens </p>
                                    </div>
                                </div>
                            </div>
                            <a href="#carouselExample" class="carousel-control-prev" data-slide="prev" role="button">
                                <span class="carousel-control-prev-icon"></span>
                            </a>
                            <a href="#carouselExample" class="carousel-control-next" data-slide="next" role="button">
                                <span class="carousel-control-next-icon"></span>
                            </a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

        
    </body>
</html>