<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Privacy Policy</title>
<style>
#ppBody {
	font-size: 13pt;
	width: 90%;
	margin: 0 auto;
	text-align: justify;
}

#ppHeader {
	font-family: verdana;
	font-size: 21pt;
	width: 90%;
	margin: 0 auto;
}

.ppConsistencies {
	display: none;
}
</style>
</head>
<body>
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
			<form action="login.do" METHOD="POST">
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
	<div id="ppHeader">Privacy Policy</div>
	<div id="ppBody">
		<div class="ppConsistencies">
			<div class="col-2">
				<div class="quick-links text-center">Information Collection</div>
			</div>
			<div class="col-2">
				<div class="quick-links text-center">Information Usage</div>
			</div>
			<div class="col-2">
				<div class="quick-links text-center">Information Protection</div>
			</div>
			<div class="col-2">
				<div class="quick-links text-center">Cookie Usage</div>
			</div>
			<div class="col-2">
				<div class="quick-links text-center">3rd Party Disclosure</div>
			</div>
			<div class="col-2">
				<div class="quick-links text-center">3rd Party Links</div>
			</div>
			<div class="col-2"></div>
			<div class="col-2"></div>
		</div>
		<div style="clear: both; height: 10px;"></div>
		<div class="ppConsistencies">
			<div class="col-2">
				<div class="col-12 quick-links2 gen-text-center">Google
					AdSense</div>
			</div>
			<div class="col-2">
				<div class="col-12 quick-links2 gen-text-center">
					Fair Information Practices
					<div class="col-8 gen-text-left gen-xs-text-center"
						style="font-size: 12px; position: relative; left: 20px;">
						Fair information<br> Practices
					</div>
				</div>
			</div>
			<div class="col-2">
				<div class="col-12 quick-links2 gen-text-center coppa-pad">
					COPPA</div>
			</div>
			<div class="col-2">
				<div class="quick-links2 gen-text-center">
					Our Contact Information<br>
				</div>
			</div>
		</div>
		<div style="clear: both; height: 10px;"></div>
		<div class="innerText">
			This privacy policy has been compiled to better serve those who are
			concerned with how their 'Personally identifiable information' (PII)
			is being used online. PII, as used in US privacy law and information
			security, is information that can be used on its own or with other
			information to identify, contact, or locate a single person, or to
			identify an individual in context. Please read our privacy policy
			carefully to get a clear understanding of how we collect, use,
			protect or otherwise handle your Personally Identifiable Information
			in accordance with our website.<br>
		</div>
		<span id="infoCo"></span><br>
		<div class="grayText">
			<strong>What personal information do we collect from the
				people that visit our blog, website or app?</strong>
		</div>
		<br>
		<div class="innerText">When ordering or registering on our site,
			as appropriate, you may be asked to enter your name, email address,
			mailing address or other details to help you with your experience.</div>
		<br>
		<div class="grayText">
			<strong>When do we collect information?</strong>
		</div>
		<br>
		<div class="innerText">We collect information from you when you
			register on our site or enter information on our site.</div>
		<br> <span id="infoUs"></span><br>
		<div class="grayText">
			<strong>How do we use your information? </strong>
		</div>
		<br>
		<div class="innerText">
			We may use the information we collect from you when you register,
			make a purchase, sign up for our newsletter, respond to a survey or
			marketing communication, surf the website, or use certain other site
			features in the following ways:<br> <br>
		</div>
		<div class="innerText">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>•</strong> To personalize
			user's experience and to allow us to deliver the type of content and
			product offerings in which you are most interested.
		</div>
		<div class="innerText">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>•</strong> To improve our
			website in order to better serve you.
		</div>
		<div class="innerText">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>•</strong> To allow us to
			better service you in responding to your customer service requests.
		</div>
		<span id="infoPro"></span><br>
		<div class="grayText">
			<strong>How do we protect visitor information?</strong>
		</div>
		<br>
		<div class="innerText">
			Our website is scanned on a regular basis for security holes and
			known vulnerabilities in order to make your visit to our site as safe
			as possible.<br> <br>
		</div>
		<div class="innerText">
			We do not use Malware Scanning.<br> <br>
		</div>
		<div class="innerText">Your personal information is contained
			behind secured networks and is only accessible by a limited number of
			persons who have special access rights to such systems, and are
			required to keep the information confidential. In addition, all
			sensitive/credit information you supply is encrypted via Secure
			Socket Layer (SSL) technology.</div>
		<br>
		<div class="innerText">We implement a variety of security
			measures when a user enters, submits, or accesses their information
			to maintain the safety of your personal information.</div>
		<br>
		<div class="innerText">All transactions are processed through a
			gateway provider and are not stored or processed on our servers.</div>
		<span id="coUs"></span><br>
		<div class="grayText">
			<strong>Do we use 'cookies'?</strong>
		</div>
		<br>
		<div class="innerText">We do not use cookies for tracking
			purposes</div>
		<div class="innerText">
			<br>You can choose to have your computer warn you each time a
			cookie is being sent, or you can choose to turn off all cookies. You
			do this through your browser (like Internet Explorer) settings. Each
			browser is a little different, so look at your browser's Help menu to
			learn the correct way to modify your cookies.<br>
		</div>
		<br>
		<div class="innerText">If you disable cookies off, some features
			will be disabled that make your site experience more efficient and
			some of our services will not function properly.</div>
		<br>
		<div class="innerText">However, you can still place orders .</div>
		<br> <span id="trDi"></span><br>
		<div class="grayText">
			<strong>Third Party Disclosure</strong>
		</div>
		<br>
		<div class="innerText">
			We do not sell, trade, or otherwise transfer to outside parties your
			personally identifiable information unless we provide you with
			advance notice. This does not include website hosting partners and
			other parties who assist us in operating our website, conducting our
			business, or servicing you, so long as those parties agree to keep
			this information confidential. We may also release your information
			when we believe release is appropriate to comply with the law,
			enforce our site policies, or protect ours or others' rights,
			property, or safety. <br> <br> However, non-personally
			identifiable visitor information may be provided to other parties for
			marketing, advertising, or other uses.
		</div>
		<span id="trLi"></span><br>
		<div class="grayText">
			<strong>Third party links</strong>
		</div>
		<br>
		<div class="innerText">Occasionally, at our discretion, we may
			include or offer third party products or services on our website.
			These third party sites have separate and independent privacy
			policies. We therefore have no responsibility or liability for the
			content and activities of these linked sites. Nonetheless, we seek to
			protect the integrity of our site and welcome any feedback about
			these sites.</div>
		<span id="gooAd"></span><br>
		<div class="blueText">
			<strong>Google</strong>
		</div>
		<br>
		<div class="innerText">
			Google's advertising requirements can be summed up by Google's
			Advertising Principles. They are put in place to provide a positive
			experience for users.
			https://support.google.com/adwordspolicy/answer/1316548?hl=en <br>
			<br>
		</div>
		<div class="innerText">We have not enabled Google AdSense on our
			site but we may do so in the future.</div>
		<span id="coppAct"></span><br>
		<div class="blueText">
			<strong>COPPA (Children Online Privacy Protection Act)</strong>
		</div>
		<br>
		<div class="innerText">
			When it comes to the collection of personal information from children
			under 13, the Children's Online Privacy Protection Act (COPPA) puts
			parents in control. The Federal Trade Commission, the nation's
			consumer protection agency, enforces the COPPA Rule, which spells out
			what operators of websites and online services must do to protect
			children's privacy and safety online.<br> <br>
		</div>
		<div class="innerText">We do not specifically market to children
			under 13.</div>
		<span id="ftcFip"></span><br>
		<div class="blueText">
			<strong>Fair Information Practices</strong>
		</div>
		<br>
		<div class="innerText">
			The Fair Information Practices Principles form the backbone of
			privacy law in the United States and the concepts they include have
			played a significant role in the development of data protection laws
			around the globe. Understanding the Fair Information Practice
			Principles and how they should be implemented is critical to comply
			with the various privacy laws that protect personal information.<br>
			<br>
		</div>
		<div class="innerText">
			<strong>In order to be in line with Fair Information
				Practices we will take the following responsive action, should a
				data breach occur:</strong>
		</div>
		<div class="innerText">We will notify the users via email</div>
		<div class="innerText">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>•</strong> Within 7 business
			days
		</div>
		<div class="innerText">
			<br>We also agree to the individual redress principle, which
			requires that individuals have a right to pursue legally enforceable
			rights against data collectors and processors who fail to adhere to
			the law. This principle requires not only that individuals have
			enforceable rights against data users, but also that individuals have
			recourse to courts or a government agency to investigate and/or
			prosecute non-compliance by data processors.
		</div>
		<span id="canSpam"></span><br>
		<div class="blueText">
			<strong>CAN SPAM Act</strong>
		</div>
		<br>
		<div class="innerText">
			The CAN-SPAM Act is a law that sets the rules for commercial email,
			establishes requirements for commercial messages, gives recipients
			the right to have emails stopped from being sent to them, and spells
			out tough penalties for violations.<br> <br>
		</div>
		<div class="innerText">
			<strong>We collect your email address in order to:</strong>
		</div>
		<div class="innerText">
			<br> <strong>To be in accordance with CANSPAM we agree
				to the following:</strong>
		</div>
		<div class="innerText">
			<strong><br>If at any time you would like to
				unsubscribe from receiving future emails, you can email us at</strong>
		</div>
		and we will promptly remove you from <strong>ALL</strong>
		correspondence.
	</div>
	<br>
	<div class="innerText" style="padding-left: 20px">
		If there are any questions regarding this privacy policy you may
		contact us using the information below.<br> <br>
	</div>
	<div class="innerText" style="padding-left: 20px">
		<br>Last Edited on 2015-05-11
	</div>
	<div
		id="xunlei_com_thunder_helper_plugin_d462f475-c18e-46be-bd10-327458d045bd"></div>
</body>
</body>
</html>