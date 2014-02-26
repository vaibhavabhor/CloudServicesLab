<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
	<title>MakeItUsable! - Home</title>
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
	
	<%@include file="./layout/header.jsp" %>
	<div id="container" style="margin: 0px 0px 70px 0px; min-height: 600px !important; overflow-y:hidden;">
	    <div class="hero-unit" style="padding: 0px; font-size: 35px; color: #fff; text-shadow: 0 1px 1px rgba(0,0,0,.4);">
			<img src="images/rt-masthead.jpg"/>
			<div style="width: auto; line-height: 40px; top: 6em; left: 6em; position: absolute; z-index: 10; margin: 0px 0px 0px 40px;">
				<p style="font-size: 45px;">Welcome to <span style="color: green;">MakeItUsable<span style="color:red">!</span></span></p>
			</div>
		</div>
	</div>

	<%@include file="./layout/footer.jsp" %>
</body>
</html>