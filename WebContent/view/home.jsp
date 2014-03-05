<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
	<title>Apple store! - Home</title>
		<%@include file="includes.jsp" %>
		<script src="snowstorm.js" type="text/javascript"></script>
		
		<script type="text/javascript">
			snowStorm.flakesMaxActive = 100;    // show more snow on screen at once
			snowStorm.useTwinkleEffect = true; // let the snow flicker in and out of view
			snowStorm.followMouse = true;
			snowStorm.freezeOnBlur = true;
			snowStorm.snowStick = true;
		</script>

</head>
<body>
	
	<div class="navbar navbar-inverse navbar-static-top">
		<div id="headerNav" class="navbar-inner">
			<a class="brand" href="/project-vars/"><span style="color: green; margin: 0px 10px 0px 10px;">MakeItUsable<span style="color: red;">!</span></span></a>
			<% if(session.getAttribute("user") != null) { %>
			<ul class="nav">
				<li><a href="/project-vars/viewProjects.htm" style="color: white;">View Projects</a></li>
			</ul>
			<% } %>
			<% if(session.getAttribute("user") == null) { %>
			<ul id="loginMenu" class="nav" style=" float:right;">
				<li><a href="/project-vars/login.htm" style="color: white;">Login</a></li>
				<li><a href="/project-vars/signup.htm" style="color: white;">Sign Up</a></li>
			</ul>
			<% } else { %>
			<ul id="loggedInMenu" class="nav" style=" float:right; padding-right: 35px;">
				<li class="dropdown" id="loggedInDown">
					<c:choose>
					    <c:when test="${user.isTester}">
					    	<a class="dropdown-toggle" data-toggle="dropdown" href="#loggedInDown" style="color: white;">Hello ${user.firstName} <span class="caret"></span></a>
					    </c:when>
	 					<c:otherwise>
	 						<a class="dropdown-toggle" data-toggle="dropdown" href="#loggedInDown" style="color: white;">Hello ${user.firstName} <span class="caret"></span></a>
	 					</c:otherwise>
 					</c:choose>
					
					<ul class="dropdown-menu">
				      <li><a href="/project-vars/showProfile.htm">Profile</a></li>
				      <li><a href="/project-vars/logout.htm">Logout</a></li>
				    </ul>
			    </li>
			</ul>
			<% } %>
		</div>
	</div>
	<div id="container" style="margin: 0px 0px 70px 0px; min-height: 600px !important; overflow-y:hidden;">
	    <div class="hero-unit" style="padding: 0px; font-size: 35px; color: #fff; text-shadow: 0 1px 1px rgba(0,0,0,.4);">
			<img src="images/rt-masthead.jpg"/>
			<div style="width: auto; line-height: 40px; top: 6em; left: 6em; position: absolute; z-index: 10; margin: 0px 0px 0px 40px;">
				<p style="font-size: 45px;">Welcome to <span style="color: green;">MakeItUsable<span style="color:red">!</span></span></p>
			</div>
		</div>
	</div>

	<div class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="navbar-inner" style="min-height: 70px;">
				<div style="margin:10px 5px 10px 5px; float:left;"><span style="color: white;">Copyright &copy; MakeItUsable!</span></div>
				<div style="margin:10px 10px 10px 10px; float: right;">
					<a href="about.htm" style="color: white;">About Us</a> <span style="color: white;">|</span> <a href="#" style="color: white;">Contact Us</a>
				</div>
		</div>
	</div>
</body>
</html>