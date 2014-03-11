<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Apple Store! - Payment</title>

<%@include file="../includes.jsp"%>
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.8/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#subForm").validate();
	});
</script>
<script
	src="http://jquery.bassistance.de/validate/additional-methods.js"></script>


</head>
<body>

<div id="container" style="padding-top: 40px;">
		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2">
						<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list">
					</ul>
				</div>
					<div class="tab-content">
						<div class="tab-pane active" id="NewUserSignUp">
							<table cellpadding="5px">
								<!--Body content-->
								<tr>
  									<h2>Please enter your card details</h2>
								</tr>
								<tr>
									<td><h5>Card Number</h5></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="cardNumber" class="required" placeholder="Your card number here">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h5>Expiration Date</h5></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="expirationDate" class="required" placeholder="MM/YY">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td><h5>Card Code</h5></td>
									<td></td>
									<td><div class="input-group">
											<input type="text" id="cardCode" class="required" placeholder="check back-side of card">
										</div></td>
								</tr>
								<tr></tr>
								<tr>
									<td></td>
									<td></td>
									<td><div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-default" id="pay" value="Pay"/>
								</div></td>
								</tr>
							</table>
						</div>
					</div>
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