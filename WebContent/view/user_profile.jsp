<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>MakeItUsable! - User Profile</title>

<%@include file="includes.jsp"%>

<script type="text/javascript">
		$(document).ready(function() {
			$('#updateinformation').click(function(event) {
				$('#UserProfile').css('display', 'none');
				$('#UpdateProfile').css('display', 'block');

			});
			
			$("#reEnterPasswordInput").keyup(checkPasswordMatch());
			 $('#updateprofilebtn').click(function(event) {
				  var fname = $('#First_Name').val();
				   var lname = $('#Last_Name').val();
				   var email = $('#Email_Id').val();
				   var password = $('#passwordInput').val();
				 //  var reenterpassword = $('#reEnterPasswordInput').val();
				   
				   $.ajax({
						url : "user_profile.htm",
					    type: "POST",
					    data : "First_Name=" + fname + "&Last_Name=" + lname + "&Email_Id=" + email + "&passwordInput=" + password + "&reEnterPasswordInput=" +reenterpassword,
					    success:function(data, textStatus, jqXHR){
					    	window.location.href="hello.htm";
					    },
					    error: function(jqXHR, textStatus, errorThrown){
					    	alert("Could not process request.. " + errorThrown);
					    }
			 });
			});
			 
			 $('#rate').dataTable( {
			    	"sDom": "<'row'<'offset1 span4 'l><'offset3 span4'f>r>t<'row'<'offset1 span4'i><'offset3 span4'p >>"
			    	//,"sPaginationType": "bootstrap"
			 });
			 
			var rating = $('#ratingValue').val();
			if(rating > 0) {
				rating = rating-0.5;
				rating = rating * 2;
			}
			$('input.star').rating('select', rating);
			$('input.star').rating('readOnly', true);
			
			$('#viewConnections').click(function(){
		 		$('#connModal').modal();
			});
			
		});

		function onLinkedInLoad() {
			IN.Event.on(IN, "auth", function() {getProfile();});
		}
		
		function getProfile() {
			IN.API.Profile("me")
			.fields("id", "firstName", "lastName", "headline", "location", "industry", "pictureUrl", "emailAddress")
			.result(getConnections);
		}
		
		function getConnections(){

			IN.API.Connections("me")
	 	    .fields("id", "firstName", "lastName", "headline", "pictureUrl")
	 	    .result(showConnections)
	 		.error(connectionError);
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
		
		function checkPasswordMatch() {
			//var checkPasswordMatch = function() {
			var password = $("#passwordInput").val();
			var rePassword = $("#reEnterPasswordInput").val();
	
			if (password != rePassword)
				$("#divCheckPasswordMatch").html("Passwords do not match!");
			else {
				$("#divCheckPasswordMatch").html("Passwords match.");
			}
		}
	</script>

</head>

<body>
	<%@include file="./layout/header.jsp"%>

	<div id="container" style="padding-top: 40px">
	
	<% if(session.getAttribute("user") == null) { %>
		<div class="container-fluid">
			<div class="row-fluid"><p>Please <a href="login.htm">login</a> to view this page.</p></div>
		</div>
	<% } else { %>
	
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span2"></div>
				<div id="UserProfile" style="margin: 0px 0px 10px 30px;">
				<div><h3>User Profile </h3></div>
				<div class="row-fluid"> 
				<c:choose>
				<c:when test="${user.isTester}">
					<input id="ratingValue" type="hidden" value="${tester.averageRating}"/>
					<div class="span2" style="background-color: ghostwhite; -webkit-box-shadow: 3px 0px 5px #888888; -moz-box-shadow: 3px 0px 5px #888888; box-shadow: 3px 0px 5px #888888; padding-left: 30px; margin-top:15px;">
						<h5> Rating </h5>
						<div id="rating-stars" style="margin-top:10px;">
							<input name="star5" type="radio" class="star {split:2}"/>
							<input name="star5" type="radio" class="star {split:2}"/>
							<input name="star5" type="radio" class="star {split:2}"/>
							<input name="star5" type="radio" class="star {split:2}"/>
							<input name="star5" type="radio" class="star {split:2}"/>
							<input name="star5" type="radio" class="star {split:2}"/>
							<input name="star5" type="radio" class="star {split:2}"/>
							<input name="star5" type="radio" class="star {split:2}"/>
							<input name="star5" type="radio" class="star {split:2}"/>
							<input name="star5" type="radio" class="star {split:2}"/>
						</div>
						<div id="rating" style="margin-left: 100px;"><h5>${tester.averageRating}</h5></div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="span1"></div>
				</c:otherwise>
				</c:choose>
					<div class="span8">
						<table>
							<tr>
								<td><h5>First Name</h5></td>
								<td></td>
								<td><span style="margin-left: 10px;">${user.firstName}</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h5>Last Name</h5></td>
								<td></td>
								<td><span style="margin-left: 10px;">${user.lastName}</span></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h5>Email</h5></td>
								<td></td>
								<td><span style="margin-left: 10px;">${user.userName}</span></td>
							</tr>

							<tr></tr>
							<tr>
		 						<td><h5>LinkedIn URL</h5></td>
								<td></td>
								<td><span style="margin-left: 10px;"><a href="${user.linkedInUrl}" target="_blank">${user.linkedInUrl}</a></span></td>
							</tr>
							
							<c:choose>
								<c:when test="${user.isTester}">
								<tr></tr>
								<tr>
									<td><h5>Rating</h5></td>
									<td></td>
									<td><span style="margin-left: 10px;">${tester.averageRating}</span></td>
								</tr>
								</c:when>
							</c:choose>
							
							
							<tr></tr>
							
							<tr>
								<td><h5>Role</h5></td>
								<td></td>
								<c:choose>
									<c:when test="${user.isTester}">
										<td><span style="margin-left: 10px;">Tester</span></td>
									</c:when>
									<c:otherwise>
										<td><span style="margin-left: 10px;">Developer Group / Project Owner</span></td>
									</c:otherwise>
								</c:choose>
							</tr>
							
							<tr></tr>
							<tr>
								<td></td>
								<td></td>
								<td>
								</td>
							</tr>
						</table>
					</div>
					</div>
					<div class="row-fluid">
						<div class="btn-group" style="margin-top: 20px; margin-left: 50px">
								<input type="submit" class="btn btn-primary" id="updateinformation" value="Update Information"/>
						</div>
						<div class="btn-group" style="margin-top: 20px; margin-left: 50px">
								<a href="#" role="button" class="btn btn-primary" id="viewConnections" data-toggle="modal">View Connections</a>
						</div>
					</div>
					<div class="row-fluid"  style="margin-top: 40px;">
					<c:choose>
								<c:when test="${ratings ne null}">
									<h3>User Ratings</h3>
									<div id="projects">
										<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"  id="rate">
											<thead>
											<tr>
												<th>Project Owner</th>
												<th>Rating</th>
												<th>Date</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="p" items="${ratings}">
												<tr>
													<td>${p.developerName}</td>
													<td>${p.rating}</td>
													<td>${p.date}</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</c:when>
							</c:choose>
				</div>
				</div>
				<div class="tab-content" id="UpdateProfile" style="display: none;">
					<div class="tab-pane active">
						<table>
							<!--Body content-->
							<tr>
								<h3>Update your information here!</h3>
							</tr>
							<tr>
								<td><h2 class="label label-primary">First Name</h2></td>
								<td></td>
								<td><div class="input-group">
										<input type="Email" id="First_Name" class="form-control"
											placeholder="First Name">
									</div></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Last Name</h2></td>
								<td></td>
								<td><div class="input-group">
										<input type="Email" id="Last_Name" class="form-control"
											placeholder="Last Name">
									</div></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Email</h2></td>
								<td></td>
								<td><div class="input-group">
										<input type="Email" id="Email_Id" class="form-control"
											placeholder="Email Id">
									</div></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Password</h2></td>
								<td></td>
								<td><div class="input-group">
										<input type="password" id="passwordInput" class="form-control"
											placeholder="Password">
									</div></td>
							</tr>
							<tr></tr>
							<tr>
								<td><h2 class="label label-primary">Re-enter Password</h2></td>
								<td></td>
								<td><div class="input-group">
										<input type="password" id="reEnterPasswordInput"
											class="required" placeholder="Re-enter Password" onChange="checkPasswordMatch();">
									</div></td>
									<td>
									<div class="registrationFormAlert" id="divCheckPasswordMatch"></div>
									</td>
							</tr>
							<tr></tr>
							<tr></tr>
							<tr>
								<td><div class="btn-group">
										<input type="submit" class="btn" id="updateprofilebtn"  value="Update Profile"/>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
		</div>
		<% } %>
	</div>
</div>

<!-- Modal Code used for Login -->
		
<div class="modal fade" id="connModal" tabindex="-1" role="dialog" aria-labelledby="connModalLabel" aria-hidden="true">
    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	          <h4 class="modal-title">User Connections</h4>
	        </div>
	        <div class="modal-body">
	        	<div style="text-align: center;"><h5>LinkedIn Connections</h5></div>
	        	<div id="connections" style="margin: 30px; text-align: center;">
	        		<script type="IN/Login"></script>
	        	</div>
	        </div>
	      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

<!-- Modal Code used for Login -->

<%@include file="./layout/footer.jsp"%>

</body>
</html>
