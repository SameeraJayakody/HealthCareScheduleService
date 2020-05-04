<%@ page import="com.item" %>
<%@ page import="database.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    




<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/confirmation.js"></script>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<div class="container">
<div class="row">
<div class="col-6">


<h1>Doctor Confirmation</h1>



<form id="formItem" name="formItem" method="post" action="Doctor.jsp" class="" align="center">
Schedule ID:<input id="id" name="id" type="text" class="form-control form-control-sm" ><br>
<label for="cars">Status:</label>
  <select id="stat" name="stat" class="form-control form-control-sm">
    <option value="YES">YES</option>
     <option value="NO" selected>NO</option>   
    
  </select><br>
  
<!-- Status: <input name="stat" type="text" ><br> -->
<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 
<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
</form>



 <div id="alertSuccess" class="alert alert-success"></div>

<div id="alertError" class="alert alert-danger"></div>
  
   <br>
   
    <div id="divItemsGrid">
    
   <%
   
      item itemobj = new item();
      out.print(itemobj.DisplayDoctor());
   %>
   
   </div>
   
   
   </div>
   </div>
   </div>


</body>
</html>