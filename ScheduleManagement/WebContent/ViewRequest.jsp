
<%@page import="com.item"%>
<%@page import="database.dbconnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<div class="container">
<div class="row">
<div class="col-6">

<h1>Doctor Message</h1>



<div id="divItemsGrid">

   <%
 item itemObj2 = new item();
out.print(itemObj2.readRequest());
%>

</div>
   
   
   </div>
   </div>
   </div>

</body>
</html>