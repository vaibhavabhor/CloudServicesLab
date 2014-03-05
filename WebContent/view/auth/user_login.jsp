<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MakeItUsable! - Login</title>

<%@include file="../includes.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		
		$('#login').click(function(event) {
			//Validate email
			if(validEmail()) {
				var email = $('#email').val();
				var password = $('#password').val();
				$.ajax({
					url : "login.htm",
				    type: "POST",
				    data : "email=" + email + "&password=" + password,
				    success:function(data, textStatus, jqXHR){
				    	window.location.href="viewProjects.htm";
				    },
				    error: function(jqXHR, textStatus, errorThrown){
				    	alert("Could not process request.. " + errorThrown);
				    }
				});
			}
		});
		
		var validEmail = function() {
			var email = $('#email');
			var EMAIL_PATTERN = /^([a-zA-Z0-9_\-\.]+([+])?[a-zA-Z0-9_\-\.]+)@((\[[0-2]{1}[0-5]{1}[0-5]{1}\.[0-2]{1}[0-5]{1}[0-5]{1}\.[0-2]{1}[0-5]{1}[0-5]{1}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-2]{1}[0-5]{1}[0-5]{1})(\]?)$/;
			var result = false;

			// show error if field is empty or invalid email is entered
			if(email.val() == null || email.val().trim() == '') {
				alert('Please enter your email.');
			} else if(!EMAIL_PATTERN.test(email.val())) {
				alert('Email is not in a valid format.');
				email.val('');
			} else {
				result = true;
			}
			return result;
			
		};
		
	});
	
	function onLinkedInLoad () {
		IN.Event.on(IN, "auth", function() {onLinkedInAuth();});
		IN.Event.on(IN, "logout", function() {onLinkedInLogout();});
	}
	
	function onLinkedInLogout() {
		$('#loggedInMenu').css('display','none');
		$('#loginMenu').css('display','block');
	}
	
	function onLinkedInAuth() {
		IN.API.Profile("me")
		.fields("id", "firstName", "lastName", "headline", "location", "industry", "pictureUrl", "emailAddress")
		.result(displayProfile);
	}
	
	function displayProfile(profiles) {
		var member = profiles.values[0];
		var email = member.emailAddress;
		$.ajax({
			url : "checkUserRegistered.htm",
		    type: "POST",
		    data : "email=" + email,
		    success:function(data, textStatus, jqXHR){
		    	if(data.response == "exists"){
		    		window.location.href = "viewProjects.htm";
		    	} else {
		    		window.location.href = "signup.htm";
		    	}
		    },
		    error: function(jqXHR, textStatus, errorThrown){
		    	alert("Could not process request.. " + errorThrown);
		    }
		});
	}

	
	
	function showConnections(connections) {
		var conn = connections.values;
		for(var c in conn) {
			$('#connections').html($('#connections').html() + "<img src=" + conn[c].pictureUrl + "></img><div id=\"" + conn[c].id + "\">Name - " +  conn[c].firstName + " " + conn[c].lastName + "<br/><div>Current Status - '" + conn[c].headline + "'</div>");
		}
	}
	
	function connectionError(error) {
		alert(error.message);
	}
	
</script>

</head>
<body>
	<div class="navbar navbar-inverse navbar-static-top">
		<div id="headerNav" class="navbar-inner">
			<a class="brand" href="/project-vars/"><span style="color: green; margin: 0px 10px 0px 10px;">New Apple Store<span style="color: red;">!</span></span></a>
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

	<div id="container" style="padding-top: 40px;" align="center">
		<div class="container-fluid">
			<div id="loginOptions" style="margin: 80px 0px 0px 600px;">
				<div class="span1"></div>
				<div class="span5">
					<div style="background-color: ghostwhite; -webkit-box-shadow: 3px 0px 5px #888888; -moz-box-shadow: 3px 0px 5px #888888; box-shadow: 3px 0px 5px #888888; padding: 30px;">
						<h3> Sign In </h3>
						<table>
							<tr>
								<td><label for="inputEmail3" class="col-sm-2 control-label">Email</label></td>
								<td><div class="col-sm-10"><input type="email" class="form-control" id="email" placeholder="Your registered email"></div></td>
							</tr>
							<tr>
								<td><label for="inputPassword3" class="col-sm-2 control-label">Password</label></td>
								<td><div class="col-sm-10"><input type="password" class="form-control" id="password" placeholder="Password"></div></td>
							</tr>
							<tr>
								<td></td>
								<td><div class="col-sm-offset-2 col-sm-10"> <button type="submit" class="btn btn-default" id="login">Login</button></div></td>
							</tr>
						</table>
					</div>
				</div>
											
			<div id="userProfile" style="margin: 80px 0px 0px 50px; display: none;">
				<div id="profile" class="span4"></div>
				<div id="connections" class="span4"></div>
			</div>
		</div>
	</div>

	<div class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="navbar-inner" style="min-height: 70px;">
				<div style="margin:10px 5px 10px 5px; float:left;"><span style="color: white;">Copyright &copy; NewAppleStore!</span></div>
				<div style="margin:10px 10px 10px 10px; float: right;">
					<a href="about.htm" style="color: white;">About Us</a> <span style="color: white;">|</span> <a href="#" style="color: white;">Contact Us</a>
				</div>
		</div>
	</div>

</body>
</html>