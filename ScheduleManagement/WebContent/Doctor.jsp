<%@ page import="com.item" %>
<%@ page import="database.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
     <%
if (request.getParameter("si") != null)
{
session.setAttribute("si", request.getParameter("si"));
session.setAttribute("stat", request.getParameter("stat"));
}
    
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<h1>Doctor Confirmation</h1>



<form method="post" action="Doctor.jsp" align="center">
ID:<input name="id" type="text" ><br>
<label for="cars">Status:</label>
  <select id="stat" name="stat">
    <option value="YES">YES</option>
     <option value="NO" selected>NO</option>
    
  </select><br>
  
<!-- Status: <input name="stat" type="text" ><br> -->
<input name="btnSubmit" type="submit" value="Save"> 
</form>


<%
item itemObj1 = new item();
out.print(itemObj1.DisplayDoctor());
%>  



<% 
 if (request.getParameter("id") != null)
{
item itemObj = new item();
String stsMsg = itemObj.updateDoctorStatus(
request.getParameter("id"),
request.getParameter("stat"));
session.setAttribute("statusMsg", stsMsg);
}


%>



</body>
</html>