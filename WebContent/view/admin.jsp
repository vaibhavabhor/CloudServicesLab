<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Apple Store! - Admin</title>

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
	
<script type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable( {
    	"sDom": "<'row'<'offset1 span4 'l><'offset3 span4'f>r>t<'row'<'offset1 span4'i><'offset3 span4'p >>"
    	//,"sPaginationType": "bootstrap"
    });
} );
</script>
<script>
$.extend( $.fn.dataTableExt.oStdClasses, {
    "sWrapper": "dataTables_wrapper form-inline"
} );

</script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('#submit')
								.click(
										function(event) {

											var productName = $(
													'#ProductName').val();
											var description = $('#Description')
													.val();
											var catalogId = $(
													'#CatalogId').val();
											var price = $(
											'#Price').val();
											var quantity = $(
											'#Quantity').val();

											$
													.ajax({
														url : "admin.htm",
														type : "POST",
														data : "productName="
																+ productName
																+ "&description="
																+ description
																+ "&catalogId="
																+ catalogId
																+ "&price="
																+ price
																+ "&quantity="
																+ quantity,
																
														success : function(
																data,
																textStatus,
																jqXHR) {
															window.location.href = "admin.htm";
														},
														error : function(jqXHR,
																textStatus,
																errorThrown) {
															alert("Could not process request.. "
																	+ errorThrown);
														}
													});
										});
					});
	
</script>

<style type="text/css">
#sidebar-list {
	font-size: 14px;
}
</style>
</head>
<body>


	<div id="container" style="padding: 50px 0px 70px 0px;">
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
				<div id="sidebar" class="span2" style="margin: 35px 20px 0px 20px; padding: 20px 0px 50px 0px; background-color: ghostwhite;">
					<!--Sidebar content-->
					<ul id="sidebar-list" class="nav nav-list">
						<li class="nav-header" style="font-size: 15px;">Admin Functions</li>
						<li class="active" style="font-size: 15px;"><a href="#AddNewProduct"
							data-toggle="tab">Add New Product</a></li>
					</ul>
				</div>
				<div>
					<div class="tab-content">
						<div class="tab-pane" id="AddNewProduct">
							<table>
							
								<!--Body content-->
								<tr>
									<td><h5  style="font-size: 14px;height: 18px;">Product Name</h5></td>
									<td></td>
									<td><div>
											<input type="text" id="ProductName" style="width: 310px;" class="form-control">
										</div></td>
								</tr>
								<tr>
									<td><h5  style="font-size: 14px;height: 18px;">Description</h5></td>
									<td></td>
									<td><div>
											<textarea rows="4" class="required" style="width: 310px;" id="Description" placeholder="Enter product description"></textarea>
										</div></td>
								</tr>
								<tr>
									<td><h5  style="font-size: 14px;height: 18px;">Catalog ID</h5></td>
									<td></td>
									<td><div>
											<input type="text" style="width: 310px;" id="CatalogId" placeholder="Enter from {1,2,3}" class="form-control">
										</div></td>
								</tr>
								
								<tr>
									<td><h5  style="font-size: 14px;height: 18px;">Price</h5></td>
									<td></td>
									<td><div>
											<input type="text" id="Price" style="width: 310px;"
												class="form-control">
										</div></td>
								</tr>
								<tr>
									<td><h5  style="font-size: 14px;height: 18px;">Quantity</h5></td>
									<td></td>
									<td><div>
											<input type="text" id="Quantity" style="width: 310px;"
												class="form-control">
										</div></td>
								</tr>
								<tr>
								<td></td>
								<td></td>
									<td><div class="col-sm-offset-2 col-sm-10" style="margin-left: 100px ; margin-top: 15px ">
											<input type="submit" class="btn btn-primary"
												id="submit" value="Add i-Product" />
										</div></td>
								</tr>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
		<%
			}
		%>
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
