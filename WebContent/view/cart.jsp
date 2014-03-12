<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Apple Store! - Shopping Cart</title>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.js" /></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.min.js" /></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap/bootstrap-dropdown.js" /></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap/bootstrap-alert.js" /></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap/bootstrap-button.js" /></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap/bootstrap-carousel.js" /></script>
<%-- 			<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap-modal.js"/></script> --%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap/bootstrap-scrollspy.js" /></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.min.css" />


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

	<div id="container" style="padding: 50px 0px 70px 0px;">
		<%-- <%	// session check code - un-comment later
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
		%> --%>
		<div class="container-fluid">
			<div class="row-fluid">
				<table cellpadding="0" cellspacing="0" border="0"
					class="table table-striped table-bordered" id="iphones"
					style="background-color: ghostwhite;">
					<thead>
						<tr>
							<th>Product Name</th>
							<th>Description</th>
							<th>Price</th>
							<th>Add To Cart</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${cart}">
							<tr>
								<td><a
									href="/CloudServicesLab/User/ShowCart/${c.email}.htm">${c.email}</a></td>
								<td>${c.name}</td>
								<td>${c.description}</td>
								<td>${c.price}</td>
							</tr>
						</c:forEach>
						<tr>
							<th>Grand Total</th>
							<th></th>
							<th>(Total here)</th>
							<th></th>
						</tr>
						<tr>
							<td></td>
							<td></td>

							<td>
								<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-default" id="submit"
										value="Proceed to Payment" />
								</div>

							</td>

						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<%-- 	<% } %> //remove comment after adding session script --%>
	</div>

</body>
</html>