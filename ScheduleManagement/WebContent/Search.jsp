
<%@page import="com.item"%>
<%@page import="database.dbconnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%
if (request.getParameter("si") != null)
{
session.setAttribute("id", request.getParameter("id"));
session.setAttribute("stat", request.getParameter("stat"));
}
    
%> 
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

<h1> Search Doctor</h1>

<form method="post" action="Search.jsp" align="center">
 Doctor ID:<input name="id" type="text" class="form-control form-control-sm"><br> 
Doctor Name: <input name="stat" type="text" class="form-control form-control-sm"><br> 
<input name="btnSubmit" type="submit" value="Save"> 
</form>




 <div id="divItemsGrid">

<% 


item itemObj3 = new item();
out.print(itemObj3.docSearch(request.getParameter("stat"),request.getParameter("id")));


%>


</div>
   
   
   </div>
   </div>
   </div>


</body>
</html>