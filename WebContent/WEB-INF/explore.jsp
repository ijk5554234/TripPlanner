<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  function explore() {
    initialize();
    var type;

    if (document.getElementById('r1').checked) {
      type = document.getElementById('r1').value;
    } else if (document.getElementById('r2').checked) {
      type = document.getElementById('r2').value;
    } else if (document.getElementById('r3').checked) {
      type = document.getElementById('r3').value;
    } else if (document.getElementById('r4').checked) {
      type = document.getElementById('r4').value;
    } else {
      alert("There was an error in your request.");
    }

    var request = {
      location : pyrmont,
      radius : 500,
      types : [ type ]
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
      position : place.geometry.location
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
      <form>
        <div style="padding: 10px 20px;">
          <h3>Please sign in</h3>
          <label for="un" class="ui-hidden-accessible">Username:</label> <input
            type="text" name="user" id="un" value="" placeholder="username"
            data-theme="a"> <label for="pw"
            class="ui-hidden-accessible">Password:</label> <input
            type="password" name="pass" id="pw" value=""
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
      <form>
        <div style="padding: 10px 20px;">
          <h3>Register Here</h3>
          <label for="un" class="ui-hidden-accessible">Username:</label> <input
            type="text" name="user" id="un" value="" placeholder="username"
            data-theme="a"> <label for="pw"
            class="ui-hidden-accessible">Password:</label> <input type="text"
            name="user" id="un" value="" placeholder="password" data-theme="a">
          <label for="pw" class="ui-hidden-accessible">Re-Passowrd:</label> <input
            type="password" name="pass" id="pw" value=""
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
  <div data-role="picture" class="ui-top" align="center">
    <form action="" onsubmit="explore();return false;" id="routeForm">
      <input type="radio" id="r1" name="type" value="store" checked>Store
      <br> <input type="radio" id="r2" name="type" value="restaurant">Restaurant
      <br> <input type="radio" id="r3" name="type" value="park">Park
      <br> <input type="radio" id="r4" name="type" value="museum">Museum
      <br> <input type="submit" value="Explore">
    </form>
    <div id="map-canvas" style="width: 710px; height: 600px"></div>
  </div>
  <div data-role="footer" data-position="fixed">
    <h1>CMU eBiz</h1>
  </div>
</body>
</html>