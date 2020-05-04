
<%@page import="com.item"%>
<%@page import="database.dbconnect"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
   







<%-- <%


/* session.setAttribute("statusMsg", "");
System.out.println("Trying to process............."); */


if (request.getParameter("btnSid") != null)
{
item itemObj = new item();
String stsMsg = "";
//Insert--------------------------
if (request.getParameter("hidItemIDSave") == "")
{
stsMsg = itemObj.insertItem(request.getParameter("btnSid"),
request.getParameter("btnHid"),
request.getParameter("btnHname"),
request.getParameter("btnDocid"),
request.getParameter("btnDocname"),
request.getParameter("btnSpecial"),
request.getParameter("btnDate"),
request.getParameter("btnStart"),
request.getParameter("btnEnd"),
request.getParameter("btnRoom"),
request.getParameter("stat"));
}
else//Update----------------------
{
stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"),
		request.getParameter("btnSid"),
		request.getParameter("btnHid"),
		request.getParameter("btnHname"),
		request.getParameter("btnDocid"),
		request.getParameter("btnDocname"),
		request.getParameter("btnSpecial"),
		request.getParameter("btnDate"),
		request.getParameter("btnStart"),
		request.getParameter("btnEnd"),
		request.getParameter("btnRoom"),
		request.getParameter("stat"));
}
session.setAttribute("statusMsg", stsMsg);
}
//Delete-----------------------------
if (request.getParameter("hidItemIDDelete") != null)
{
	item itemObj = new item();
String stsMsg = itemObj.deleteItem(request.getParameter("hidItemIDDelete"));
session.setAttribute("statusMsg", stsMsg);
}


%> --%>


<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/items.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="container">
<div class="row">
<div class="col-6">

<h1>Schedule Management</h1>
<form id="formItem" name="formItem" method="post" action="TimeCollector.jsp">

Schedule ID:        <input id="btnSid" name="btnSid" type="number" class="form-control form-control-sm" placeholder="Ex:*123456*"><br>
Hospital ID:     <input id="btnHid" name="btnHid" type="text" class="form-control form-control-sm" placeholder="Ex:*123HP*"><br>
Hospital Name:   <input id="btnHname" name="btnHname" type="text" class="form-control form-control-sm" placeholder="Ex:*xxxxxx*"><br>
Doctor ID:     <input id="btnDocid" name="btnDocid" type="text" class="form-control form-control-sm" placeholder="Ex:*123AH*"><br>
Doctor Name:   <input id="btnDocname" name="btnDocname" type="text" class="form-control form-control-sm" placeholder="Ex:*xxxxxx*"><br>
<!-- SPECIALITY: <input id="btnSpecial" name="btnSpecial" type="text" class="form-control form-control-sm"><br>
 -->

Specialization:    
					<select id="btnSpecial" name="btnSpecial" class="form-control form-control-sm" placeholder="Ex:*General*">     
						<option value="0">--Select Specialization--</option>     
						<option value="Accupuncture">Accupuncture</option>     
						<option value="Anaesthesiologist">Anaesthesiologist</option>
						<option value="Allergy Specialist">Allergy Specialist</option>     
						<option value="Bacteriologist">Bacteriologist</option>     
						<option value="Cardiologist">Cardiologist</option>
						<option value="Cardiac Surgeon">Cardiac Surgeon</option>
						<option value="Counsellor">Counsellor</option>
						<option value="Dentist">Dentist</option>
						<option value="Dietician">Dietician</option>
						<option value="Embryologist">Embryologist</option>
						<option value="Endocnnologist">Endocnnologist</option>
						<option value="Ent And Neck Surgeon">Ent And Neck Surgeon</option>
						<option value="General">General</option>
						<option value="Hepatologists">Hepatologists</option>
						<option value="Immunologist">Immunologist</option> 
						<option value="Mycologist">Mycologist</option> 
						<option value="Neurologist">Neurologist</option>   
						<option value="Urologist">Urologist</option>
						  	
					</select>
					<br>

Schedule Date:       <input id="btnDate" name="btnDate" type="date" class="form-control form-control-sm"><br>
Start Time:      <input id="btnStart" name="btnStart" type="time" class="form-control form-control-sm"><br>
End Time:        <input id="btnEnd" name="btnEnd" type=time class="form-control form-control-sm"><br>
Room Number:       <input id="btnRoom" name="btnRoom" type="text" class="form-control form-control-sm" placeholder="Ex:*10*"><br>

Status:
  <select id="stat" name="stat" class="form-control form-control-sm">
    <option value="YES">YES</option>
     <option value="NO" selected>NO</option>
    
  </select><br>
  

<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary"> 

<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">

</form>



 <div id="alertSuccess" class="alert alert-success"></div>

<div id="alertError" class="alert alert-danger"></div>
  
   <br>
   
    <div id="divItemsGrid">
    
   <%
   
      item itemobj = new item();
      out.print(itemobj.readItems());
   %>
   
   </div>
   
   
   </div>
   </div>
   </div>


</body>
</html>