<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>VARS - User created</title>
</head>
<body>

Hurray, User created successfully!!
<BR/>
User information is displayed below:
<BR/>
User First Name: ${user.firstName}
<BR/>
User Last Name: ${user.lastName}
<BR/>
User Email: ${user.email}

</body>
</html>