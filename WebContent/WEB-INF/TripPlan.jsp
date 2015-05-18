<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Trip Planner</title>
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
<style>
#results {
	font-family: Arial, Helvetica, sans-serif;
	position: absolute;
	right: 5px;
	top: 50%;
	margin-top: -195px;
	height: 380px;
	width: 200px;
	padding: 5px;
	z-index: 5;
	border: 1px solid #999;
	background: #fff;
}
</style>
<script type="text/javascript">
  var directionDisplay;
  var currentLocation;
  var geocoder;
  var schedule;
  var directionsService = new google.maps.DirectionsService();
  $(document).ready(function()
      {
        navigator.geolocation.getCurrentPosition(initialize);
      });

  function initialize(location) {
    currentLocation = new google.maps.LatLng(location.coords.latitude, location.coords.longitude)
    
    directionsDisplay = new google.maps.DirectionsRenderer();

    geocoder = new google.maps.Geocoder();
   

 
  geocoder.geocode({'latLng': currentLocation}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      if (results[1]) {     
         document.getElementById("origin").value = results[1].formatted_address;
  
      } else {
        alert('No results found');
      }
    } else {
      alert('Geocoder failed due to: ' + status);
    }
  });
  


    var myOptions = {
      zoom: 14,
      center: currentLocation,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      mapTypeControl: false
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"),myOptions);
    directionsDisplay.setMap(map);
    directionsDisplay.setPanel(document.getElementById("directionsPanel"));
    var marker = new google.maps.Marker({
      position: currentLocation, 
      map: map, 
      title:"My location"
    }); 
  }

  function calcRoute() {
	var end;
	if (document.getElementById("destination").value.length == 0)
		end = "222 melwood, pittsburgh";
	else
		end = document.getElementById("destination").value;
    var start = document.getElementById("origin").value;
    var request = {
      origin:start,
      destination:end,
      travelMode: google.maps.DirectionsTravelMode.TRANSIT
    };
    directionsService.route(request, function(response, status) {
     if (status == google.maps.DirectionsStatus.OK) {
    directionsDisplay.setDirections(response);
  }else{

      if (status == 'ZERO_RESULTS') {
        alert('No route could be found between the origin and destination.');
      } else if (status == 'UNKNOWN_ERROR') {
        alert('A directions request could not be processed due to a server error. The request may succeed if you try again.');
      } else if (status == 'REQUEST_DENIED') {
        alert('This webpage is not allowed to use the directions service.');
      } else if (status == 'OVER_QUERY_LIMIT') {
        alert('The webpage has gone over the requests limit in too short a period of time.');
      } else if (status == 'NOT_FOUND') {
        alert('At least one of the origin, destination, or waypoints could not be geocoded.');
      } else if (status == 'INVALID_REQUEST') {
        alert('The DirectionsRequest provided was invalid.');         
      } else {
        alert("There was an unknown error in your request. Requeststatus: nn"+status);
      }
    }
    });


  schedule = document.getElementById('schedules');

  schedule.innerHTML=  '<Li>' + "71A      Arrives in 10 Min" + '</Li>';
  schedule.innerHTML +=  '<Li>' + "71A      Arrives in 25 Min:" + '</Li>';
  schedule.innerHTML +=  '<Li>' + "82      Arrives in 3 Min" + '</Li>';
  schedule.innerHTML +=  '<Li>' + "82      Arrives in 10 Min" + '</Li>';
  schedule.innerHTML +=  '<Li>' + "71C      Arrives in 30 Min" + '</Li>';
  }

  </script>
</head>
<body onload="initialize()">
<!------------------------------ Navigation Bar Start------------------------------>
	<div data-role="navbar">
	<ul>
		<li><a href="manage.do"  data-position-to="window" data-role="button" data-inline="true">Home</a></li>
		<li><a rel="external" href="PrivacyAction.do"  data-position-to="window" data-role="button" data-inline="true">Privacy Policy</a></li>
		<c:choose>
			<c:when test="${(!empty user)}">

				<li >
					<a href="#popupSet" data-rel="popup" data-position-to="window" data-role="button" data-inline="true"
					data-transition="slideup" data-theme="a">Setting</a>
				</li>
				<li>
					<form action="logout.do">	
						<button type="submit" data-transition="slideup" data-inline="true" data-theme="a">Logout
					</form>
				</li>
				 
				<li>
				<a href="#" data-position-to="window" data-role="button" data-inline="true"
					data-transition="slideup" data-theme="b">Welcome, ${user.firstName} ${user.lastName}!</a>
				</li>
				
			</c:when>
			<c:otherwise>
				<li><a
					href="#popupLogin" data-rel="popup" data-position-to="window"
					data-role="button" data-inline="true" data-theme="a"
					data-transition="pop">Sign in</a></li>
				<li><a href="#popupReg" data-rel="popup" data-position-to="window" data-role="button" data-inline="true" data-theme="a"
					data-transition="pop">Register</a></li>
			</c:otherwise>	
		</c:choose>
	</ul>
	</div>

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
						type="text" name="home" id="home" value="${form.home}" placeholder="Home Adress"
						data-theme="a"> <label for="work"
						class="ui-hidden-accessible">Work Place Address:</label> <input
						type="text" name="work" id="work" value="${form.work}"
						placeholder="Work Place Address" data-theme="a">
					<button type="submit" data-theme="b" data-icon="check">Confirm</button>
				</div>
			</form>
		</div>
	</div>
	
<!------------------------------ Navigation Bar End------------------------------>

	<div data-theme="a" id="tripPlanner">

		<div data-role="picture" class="ui-top" align="center">
		
			<form method="post" action="/routebeschrijving"
				onsubmit="calcRoute();return false;" id="routeForm">
				<div class="ui-field-contain">
					<label for="from">From:</label> <input id="origin" type="text"
						value="" placeholder="Current Location"> <label for="to">To:</label>
					<input id="destination" type="text" value="" placeholder="">
				</div>
				<input id="inputSearch" type="submit" data-block="true"
					value="Search">
			</form>
			
			
		</div>
		
		<div id="map_canvas" style="margin-left: -40%; width: 300px; height: 500px"></div>
		<div id="results" style="visibility: hidden">
			<ul id="schedules"></ul>
		</div>
		
		<br>
		<br>
		<div id="directionsPanel" style="background:white;"></div>
		<br>
		<form method="post" action="/routebeschrijving"
				onsubmit="calcRoute();return false;" id="routeForm">
				<input id="inputSearch" type="submit" data-block="true"
					value="Take Me Home">
				<a href="takeWork.do" class="ui-btn ui-btn-inline"
					style="width: 100%;">Take Me Work</a>
		</form>
	</div>	
</body>
</html>