<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MakeItUsable! - View Project</title>

<%@include file="includes.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {
 			$('#submitRating').click(function(event) {
 				var inputRating = $('#inputRating').val();
 				console.log("rating is"+ inputRating);
 				var developer_id = $('#developer_ID').val();
 				var tester_id = $('#tester_ID').val();
 				$.ajax({
 					url : "/project-vars/selectRating/" + inputRating + ".htm",
 				    type: "POST",
 				   data : "inputRating="+ inputRating +"&developerID="+developer_id+"&testerID="+tester_id ,
 		 		    success:function(data, textStatus, jqXHR){
 		 		    	window.location.href="/project-vars/viewProjects.htm";
 		 		    },
 		 		    error: function(jqXHR, textStatus, errorThrown){
 		 		    	alert("Could not process request.. " + errorThrown);
 		 		    }
 				});
 			});
			
		});
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

	<div id="container" style="padding-top: 40px;">
	
	<% if(session.getAttribute("user") == null) { %>
		<div class="container-fluid">
			<div class="row-fluid"><p>Please <a href="login.htm">login</a> to view this page.</p></div>
		</div>
	<% } else { %>
	
		<div class="container-fluid">
			<div class="row-fluid">
			<div class="span2"></div>
				<input type="hidden" id="projectId" name="projectId" value="${project.project_id}"/>
				<input type="hidden" id="developer_ID" name="developer_Id" value="${project.developer_id}" />
				<input type="hidden" id="tester_ID" name="tester_Id" value="${project.tester_id}" />
				<div class="tab-content" id="projectDetails">
					<div class="tab-pane active">
						<table cellpadding="5px">
							<!--Body content-->
							<tr>
								<h3>Project Details </h3>
							</tr>
							<tr>
								<td><h5>Project Name</h5></td>
								<td></td>
								<td><span>${project.title}</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h5>Project Description</h5></td>
								<td></td>
								<td><span>${project.description}</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h5>Project Domain</h5></td>
								<td></td>
								<td><span>${project.domain}</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h5>Developer</h5></td>
								<td></td>
								<td><span>${project.developerName}</span></td>
							</tr>

							<tr></tr>
							<tr>
								<td><h5>Tester</h5></td>
								<td></td>
								<td><span>${project.testerName}</span></td>
							</tr>
							
							<tr></tr>
							<tr>
								<td><h5>Result</h5></td>
								<td></td>
								<td><span>${project.results}</span></td>
							</tr>
							<tr></tr>
							
							<c:choose>
								<c:when test="${project.results eq null}">
								<tr></tr>
							<tr>
								<td></td>
								<td></td>
								<td><div class="btn-group">
										<a href="/project-vars/bids/${project.project_id}.htm" class="btn btn-primary" id="bids">View All Bids</a>
									</div>
								</td>
							</tr>
							</c:when>
							<c:otherwise>
							<tr>
								<td><h5>Rate the tester</h5></td>
								<td></td>
								<td><textarea class="required" id="inputRating" placeholder="Rating in between 1 to 5"></textarea></td>
							</tr>
							<tr></tr>
							<tr>
								<td></td>
								<td></td>
								<td><div class="btn-group">
										<a class="btn btn-primary" id="submitRating">Submit Rating</a>
									</div>
								</td>
							</tr>
							</c:otherwise>
							</c:choose>
						</table>
					</div>
				</div>
			</div>

		</div>
		<% } %>
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








