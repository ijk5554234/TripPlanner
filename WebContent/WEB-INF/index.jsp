<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Explore</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet" href="css/homepage.css" />
<link rel="stylesheet" href="css/jquery.mobile-1.4.0.min.css" />
<link rel="stylesheet" href="css/theme-classic.css" />
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true&libraries=places"></script>
</head>
<body>

	<nav id="nav">
	<ul class="container">
		<li><a href="index.html">Home</a></li>
		<li><a href="privacypolicy.htm">Privacy Policy</a></li>
		<li class="navPullRight"><a class="navSet" href="#popupSet"
			data-rel="popup" data-role="button" data-inline="true"
			data-transition="slideup" data-icon="gear" data-theme="a"></a></li>
			
		
		<li class="navPullRight" style="font-size: 15px;"><a
			href="#popupReg" data-rel="popup" data-position-to="window"
			data-role="button" data-inline="true" data-theme="a"
			data-transition="pop">Register</a></li>
		<li class="navPullRight" style="font-size: 15px;"><a
			href="#popupLogin" data-rel="popup" data-position-to="window"
			data-role="button" data-inline="true" data-theme="a"
			data-transition="pop">Sign in</a></li>
			
		
	</ul>
	</nav>

	<div data-role="popup" id="popupMenu" data-theme="a">
		<div data-role="popup" id="popupLogin" data-theme="a"
			class="ui-corner-all">
			<form action="login.do">
				<div style="padding: 10px 20px;">
					<h3>Please sign in</h3>
					<label for="un" class="ui-hidden-accessible">UserName:</label> <input
						type="text" name="userName" id="un" value="" placeholder="username"
						data-theme="a"> <label for="pw"
						class="ui-hidden-accessible">Password:</label> <input
						type="password" name="password" id="pw" value=""
						placeholder="password" data-theme="a">
					<button type="submit" data-theme="b" data-icon="check">Sign
						in</button>
				</div>
			</form>
		</div>
	</div>

	<div data-role="popup" id="popupMenu" data-theme="a">
		<div data-role="popup" id="popupReg" data-theme="a"
			class="ui-corner-all">
			<form action="register.do">
				<div style="padding: 10px 20px;">
					<h3>Register Here</h3>
					<label for="un" class="ui-hidden-accessible">Username:</label> <input
						type="text" name="user" id="un" value="" placeholder="username"
						data-theme="a"> 
					<label for="pw" class="ui-hidden-accessible">Password:</label> <input type="text"
						name="user" id="un" value="" placeholder="password" data-theme="a">
					<label for="pw" class="ui-hidden-accessible">Re-Password:</label> <input
						type="password" name="password" id="pw" value=""
						placeholder="re-password" data-theme="a">
					<button type="submit" data-theme="b" data-icon="check">Register</button>
				</div>
			</form>
		</div>
	</div>

	<div data-role="popup" id="popupMenu" data-theme="a">
		<div data-role="popup" id="popupSet" data-theme="a"
			class="ui-corner-all">
			<form>
				<div style="padding: 10px 20px;">
					<h3>Input your information</h3>
					<label for="un" class="ui-hidden-accessible">Home Adress:</label> <input
						type="text" name="user" id="un" value="" placeholder="Home Adress"
						data-theme="a"> <label for="pw"
						class="ui-hidden-accessible">Work Place Address:</label> <input
						type="text" name="user" id="un" value=""
						placeholder="Work Place Address" data-theme="a">
					<button type="submit" data-theme="b" data-icon="check">Confirm</button>
				</div>
			</form>
		</div>
	</div>

	<div data-role="content" data-theme="a" id="homePage">

		<div data-role="picture" class="ui-top" align="center">
			<img src="img/paac.jpg" alt="logo" align="middle"
				style="width: 45%; height: 45%">
						<jsp:include page="error-list.jsp" />
				
		</div>

		<div data-role="Enter" class="ui-content" align="center">
			<a rel="external" href="Trip Planner.html"
				class="ui-btn ui-btn-inline"
				style="width: 50px; height: 50px; border-radius: 50%; background: url(https://www.viamente.com/wp-content/uploads/icon_step_1_parte_2.png) center center no-repeat;"></a>
			<a rel="external" href="Trip Planner.html"
				class="ui-btn ui-btn-inline"
				style="width: 70%; line-height: 50px; height: 50px">Trip Planner</a>
			<br> <a rel="external" href="Bus Locator.html"
				class="ui-btn ui-btn-inline"
				style="width: 50px; height: 50px; border-radius: 50%; background: url(http://files.softicons.com/download/web-icons/awt-travel-blue-icons-by-awt-media/png/64x64/AWT-Bus.png) center center no-repeat;"></a>
			<a rel="external" href="Bus Locator.html"
				class="ui-btn ui-btn-inline"
				style="width: 70%; line-height: 50px; height: 50px">Bus Locator</a>
			<br> <a rel="external" href="Fare Checker.html"
				class="ui-btn ui-btn-inline"
				style="width: 50px; height: 50px; border-radius: 50%; background: url(http://www.cascadeseasttransit.com/images/fare_icon.png) center center no-repeat;"></a>
			<a rel="external" href="Fare Checker.html"
				class="ui-btn ui-btn-inline"
				style="width: 70%; line-height: 50px; height: 50px">Fare Checker</a>
			<br> <a rel="external" href="Nearby Attraction.html"
				class="ui-btn ui-btn-inline"
				style="width: 50px; height: 50px; border-radius: 50%; background: url(http://wpgeo.directory/wp-content/uploads/2014/05/attractions.png) center center no-repeat;"></a>
			<a rel="external" href="Nearby Attraction.html"
				class="ui-btn ui-btn-inline"
				style="width: 70%; line-height: 50px; height: 50px">Nearby
				Attractions</a> <br>
		</div>

		<div data-role="footer" data-position="">
			<h1>CMU eBiz</h1>
		</div>
	</div>
</body>
</html>