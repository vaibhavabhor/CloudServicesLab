<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Apple Store! - Products</title>


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


<style type="text/css">
#sidebar-list {
	font-size: 14px;
}
</style>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#profile')
								.dataTable(
										{
											"sDom" : "<'row'<'offset1 span4 'l><'offset3 span4'f>r>t<'row'<'offset1 span4'i><'offset3 span4'p >>"
										});
					});
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#orders')
								.dataTable(
										{
											"sDom" : "<'row'<'offset1 span4 'l><'offset3 span4'f>r>t<'row'<'offset1 span4'i><'offset3 span4'p >>"
										});
					});
</script>
<script>
	$.extend($.fn.dataTableExt.oStdClasses, {
		"sWrapper" : "dataTables_wrapper form-inline"
	});
</script>
</head>
<body>

	<div id="container" style="padding-top: 40px">

		<%
			if (session.getAttribute("user") == null) {
		%>
		<div class="container-fluid">
			<div class="row-fluid">
				<p>
					Please <a href="login.htm">login</a> to view this page.
				</p>
			</div>
		</div>
		<%
			} else {
		%>

		<div class="container-fluid">
			<div class="row-fluid">
				<div id="sidebar" class="span2"
					style="margin: 35px 20px 0px 20px; padding: 20px 0px 50px 0px; background-color: ghostwhite;">
					<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list"
						style="background-color: #f7f5fa;">
						<li class="nav-header" style="font-size: 15px;">User Options</li>
						<li class="active" style="font-size: 15px;"><a
							href="#UserProfile" data-toggle="tab">Show my Profile</a></li>
						<li style="font-size: 15px;"><a href="#ShowMyOrders"
							data-toggle="tab">Show My Orders</a></li>
					</ul>
				</div>
				<div class="tab-content">
					<div class="tab-pane active" id="ShowiPhones">
						<div id="UserProfile" style="margin: 0px 0px 10px 30px;">
							<div>
								<h3>User Profile</h3>
							</div>
							<div class="row-fluid">

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
											<td><span style="margin-left: 10px;">${user.email}</span></td>
										</tr>

										<tr></tr>
										<tr>
											<td><h5>Address</h5></td>
											<td></td>
											<td><span style="margin-left: 10px;">${user.address}</span></td>
										</tr>
										<tr></tr>
										<tr>
											<td><h5>Mobile</h5></td>
											<td></td>
											<td><span style="margin-left: 10px;">${user.mobile}</span></td>
										</tr>
										<tr></tr>
										<tr>
											<td><h5>Last Login</h5></td>
											<td></td>
											<td><span style="margin-left: 10px;">${user.lastLogin}</span></td>
										</tr>

										<tr></tr>
										<tr></tr>
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
					</div>

					<div class="tab-pane" id="#ShowMyOrders">
						<c:choose>
							<c:when test="${order ne null}">
								<div id="orders">
									<table cellpadding="0" cellspacing="0" border="0"
										class="table table-striped table-bordered" id="orders">
										<thead>
											<tr>
												<th>Order ID</th>
												<th>Product ID</th>
												<th>Quantity</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="o" items="${order}">
												<tr>
													<td>${o.id}</td>
													<td>${o.productId}</td>
													<td>${o.quantity}</td>
													<td>${o.price}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</c:when>
							<c:otherwise>
								<div id="orders">
									<h5>Sorry, you have not shopped previously. Please shop
										first to see orders.</h5>
								</div>

							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<% } %>
		</div>
	</div>

	<div class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="navbar-inner" style="min-height: 70px;">
			<div style="margin: 10px 5px 10px 5px; float: left;">
				<span style="color: white;">Copyright &copy; NewAppleStore!</span>
			</div>
			<div style="margin: 10px 10px 10px 10px; float: right;">
				<a href="about.htm" style="color: white;">About Us</a> <span
					style="color: white;">|</span> <a href="#" style="color: white;">Contact
					Us</a>
			</div>
		</div>
	</div>


</body>
</html>
