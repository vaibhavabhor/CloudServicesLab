<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Apple Store! - Products</title>


<%@include file="../includes.jsp" %>

<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.8/jquery.validate.min.js"></script>
<script type="text/javascript"> $(document).ready(function(){ $("#subForm").validate(); }); </script>
<script src="http://jquery.bassistance.de/validate/additional-methods.js"></script>
<script type="text/javascript">

<style type="text/css">
#sidebar-list {
	font-size: 14px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    $('#iphones').dataTable( {
    	"sDom": "<'row'<'offset1 span4 'l><'offset3 span4'f>r>t<'row'<'offset1 span4'i><'offset3 span4'p >>"
    });
} );
</script>
<script type="text/javascript">
$(document).ready(function() {
    $('#ipads').dataTable( {
    	"sDom": "<'row'<'offset1 span4 'l><'offset3 span4'f>r>t<'row'<'offset1 span4'i><'offset3 span4'p >>"
    });
} );
</script>
<script>
$.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
} );

</script>
<script type="text/javascript">
$(document).ready(function() {
    $('#macbooks').dataTable( {
    	"sDom": "<'row'<'offset1 span4 'l><'offset3 span4'f>r>t<'row'<'offset1 span4'i><'offset3 span4'p >>"
    });
} );
</script>

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
				<div id="sidebar" class="span2" style="margin: 35px 20px 0px 20px; padding: 20px 0px 50px 0px; background-color: ghostwhite;">
					<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list"  style="background-color: #f7f5fa;">
						<li class="nav-header" style="font-size: 15px;">Catalogs</li>
						<li class="active" style="font-size: 15px;"><a href="#ShowiPhones"
							data-toggle="tab">i-Phones</a></li>
						<li style="font-size: 15px;"><a href="#showiPads" data-toggle="tab">i-Pads</a></li>
						<li style="font-size: 15px;"><a href="#showMacBooks" data-toggle="tab">Mac Books</a></li>
					</ul>
				</div>
				<div>
					<div class="tab-content">
						<div class="tab-pane active" id="ShowiPhones">
							<c:choose>
								<c:when test="${catalog eq iphone}">
									<div id="projects">
										<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"  id="iphones" style="background-color: ghostwhite;">
											<thead>
											<tr>
												<th>Product Name</th>
												<th>Description</th>
												<th>Price</th>
												<th>Add To Cart</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="p" items="${product}">
												<tr>
													<td><a href="/CloudServicesLab/Products/ShowProducts/${p.productId}.htm">${p.productId}</a></td>
													<td>${p.name}</td>
													<td>${p.description}</td>
													<td>${p.price}</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</c:when>
								<c:otherwise>
									<div id="projects">
										<h5>Sorry, there are no available new products. Check
											later.</h5>
									</div>
								</c:otherwise>
							</c:choose>
						</div>

						<div class="tab-pane" id="#showiPads">
							<c:choose>
								<c:when test="${catalog eq ipad}">
									<div id="projects">
										<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"  id="ipads">
											<thead>
											<tr>
												<th>Product Name</th>
												<th>Description</th>
												<th>Price</th>
												<th>Add To Cart</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="p" items="${product}">
												<tr>
													<td><a
														href="/CloudServicesLab/Products/ShowProducts/${p.productId}.htm">${p.productId}</a></td>
													<td>${p.name}</td>
													<td>${p.description}</td>
													<td>${p.price}</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>

								</c:when>
								<c:otherwise>
									<div id="projects">
										<h5>
											Sorry, there are no available new products. Check
											later.
										</h5>
									</div>

								</c:otherwise>
							</c:choose>
						</div>
						
						<div class="tab-pane active" id="showMacBooks">
							<c:choose>
								<c:when test="${catalog eq macbook}">
									<div id="projects">
										<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered"  id="macbooks" style="background-color: ghostwhite;">
											<thead>
											<tr>
												<th>Product Name</th>
												<th>Description</th>
												<th>Price</th>
												<th>Add To Cart</th>
											</tr>
											</thead>
											<tbody>
											<c:forEach var="p" items="${product}">
												<tr>
													<td><a href="/CloudServicesLab/Products/ShowProducts/${p.productId}.htm">${p.productId}</a></td>
													<td>${p.name}</td>
													<td>${p.description}</td>
													<td>${p.price}</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</c:when>
								<c:otherwise>
									<div id="projects">
										<h5>Sorry, there are no available new products. Check
											later.</h5>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
<%-- 		<% } %> //remove comment after adding session script --%>
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