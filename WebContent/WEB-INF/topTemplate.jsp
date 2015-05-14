<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	<!------------------------------ Navigation Bar Start------------------------------>
	<nav id="nav">
	<ul class="container">
		<li><a href="manage.do">Home</a></li>
		<li><a rel="external" href="PrivacyAction.do">Privacy Policy</a></li>
		<c:choose>
			<c:when test="${(!empty user)}">
				<li class="navPullRight"><a class="navSet" href="#popupSet"
					data-rel="popup" data-role="button" data-inline="true"
					data-transition="slideup" data-icon="gear" data-theme="a"></a></li>
				<li class="navPullRight">Welcome, ${user.firstName}
					${user.lastName}</li>
				<li class="navPullRight" style="font-size: 15px;">
				<form action="logout.do">	
					<button type="submit" data-transition="slideup" data-inline="true" data-theme="a">Logout
				</form>
				</li>
			</c:when>
			<c:otherwise>
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
			</c:otherwise>	
		</c:choose>
	</ul>
	</nav>

	<div data-history="false" data-role="popup" id="popupMenu" data-theme="a">
		<div data-history="false" data-role="popup" id="popupLogin" data-theme="a"
			class="ui-corner-all">
			<form action="login.do">
				<div style="padding: 10px 20px;">
					<h3>Please sign in</h3>
					<label for="un" class="ui-hidden-accessible">UserName:</label> <input
						type="text" name="userName" id="un" value="${form.userName}"
						placeholder="username" data-theme="a"> <label for="pw"
						class="ui-hidden-accessible">Password:</label> <input
						type="password" name="password" id="pw" value="${form.password}"
						placeholder="password" data-theme="a">
					<button type="submit" data-theme="b" data-icon="check">Sign
						in</button>
				</div>
			</form>
		</div>
	</div>

	<div data-history="false" data-role="popup" id="popupMenu" data-theme="a">
		<div  data-history="false" data-role="popup" id="popupReg" data-theme="a"
			class="ui-corner-all">
			<form action="register.do">
				<div style="padding: 10px 20px;">
					<h3>Register Here</h3>
					
					<label for="userName" class="ui-hidden-accessible">User Name:</label> 
					<input type="text" name="userName" id="userName" value="${form.userName}" placeholder="username" data-theme="a"> 
						
					<label for="firstName" class="ui-hidden-accessible">First Name:</label> 
					<input type="text"	name="firstName" id="firstName" value="${form.firstName}" placeholder="First Name" data-theme="a">
					
					<label for="lastName" class="ui-hidden-accessible">Last Name:</label> 
					<input type="text"	name="lastName" id="lastName" value="${form.lastName}" placeholder="Last Name" data-theme="a">
					
					<label for="password" class="ui-hidden-accessible">Password:</label>
				    <input type="text" name="password" id="password" value="${form.password}" placeholder="password" data-theme="a"> 
				    
				    <label for="rePass" class="ui-hidden-accessible">Re-Password:</label> 
				    <input type="text" name="rePass" id="rePass" value="${form.rePass}" placeholder="re-password" data-theme="a">
				
					
					<button type="submit" data-theme="b" data-icon="check">Register</button>
				</div>
			</form>
		</div>
	</div>

	<div data-role="popup" id="popupMenu" data-theme="a">
		<div data-role="popup" id="popupSet" data-theme="a"
			class="ui-corner-all">
			<form action = "setAddr.do">
				<div style="padding: 10px 20px;">
					<h3>Input your information</h3>
					<label for="home" class="ui-hidden-accessible">Home Adress:</label> <input
						type="text" name="home" id="home" value="" placeholder="Home Adress"
						data-theme="a"> <label for="work"
						class="ui-hidden-accessible">Work Place Address:</label> <input
						type="text" name="work" id="work" value=""
						placeholder="Work Place Address" data-theme="a">
					<button type="submit" data-theme="b" data-icon="check">Confirm</button>
				</div>
			</form>
		</div>
	</div>
<!------------------------------ Navigation Bar End------------------------------>
</body>
</html>