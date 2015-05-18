<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%> 
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
<script>
  var map;
  var infowindow;
  var pyrmont;
  function initialize() {
    pyrmont = new google.maps.LatLng(40.442492, -79.942553, 17);

    map = new google.maps.Map(document.getElementById('map-canvas'), {
      center : pyrmont,
      zoom : 14
    });

    var marker = new google.maps.Marker({
      position : pyrmont,
      map : map,
      title : "My location"
    });

  }

  function explore(){
	  initialize();
	   var type;
	   if(document.getElementById("destination").value==""){
	  if (document.getElementById('r1').checked) {
	  type = document.getElementById('r1').value;
	}else if(document.getElementById('r2').checked){
	  type = document.getElementById('r2').value;
	}else if(document.getElementById('r3').checked){
	   type = document.getElementById('r3').value;
	}else if(document.getElementById('r4').checked){
	   type = document.getElementById('r4').value;
	}else{
	    alert("There was an error in your request.");
	}
	}else{
	  type = document.getElementById("destination").value;
	}



	   var request = {
	    location: pyrmont,
	    radius: 500,
	    types: [type]
	  };
	  infowindow = new google.maps.InfoWindow();
	  var service = new google.maps.places.PlacesService(map);
	  service.nearbySearch(request, callback);
	}
  function callback(results, status) {
    if (status == google.maps.places.PlacesServiceStatus.OK) {
      for (var i = 0; i < results.length; i++) {
        createMarker(results[i]);
      }
    }
  }

  function createMarker(place) {
    var placeLoc = place.geometry.location;
    var marker = new google.maps.Marker({
      map : map,
      position : place.geometry.location,
      icon: {
          // Star
          path: 'M 0,-24 6,-7 24,-7 10,4 15,21 0,11 -15,21 -10,4 -24,-7 -6,-7 z',
          fillColor: '#ffff00',
          fillOpacity: 1,
          scale: 2/3,
          strokeColor: '#bd8d2c',
          strokeWeight: 1
        }
      
    });

    google.maps.event.addListener(marker, 'click', function() {
      infowindow.setContent(place.name);
      infowindow.open(map, this);
    });
  }

  //google.maps.event.addDomListener(window, 'load', initialize);
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

<!--------------------------Content-------------------------->
<div data-role="fieldcontain">
    <fieldset data-role="controlgroup" data-type="horizontal">    
    <legend>Choose an attraction:</legend>
    <form action="" onsubmit="explore();return false;" id="routeForm">
      <input type="radio" id="r1" name="type" value="store" >
      <label for="r1">Store</label>
      
      <input type="radio" id="r2" name="type" value="restaurant">
      <label for="r2">Restaurant</label>
      
      <input type="radio" id="r3" name="type" value="park">
      <label for="r3">Park</label>
      
      <input type="radio" id="r4" name="type" value="museum">
      <label for="r4">Museum</label>
      <br>
      <br>
      <input type="text" id="destination" value="" placeholder="Input your own choice here">
      <input type="submit" data-block="true" style="display: block" value="Explore">
	  
    </form>
   	</fieldset>
 </div>
 <div id="map-canvas" style="margin: auto; width: 300px; height: 500px"></div>
 <br>
</body>
</html>