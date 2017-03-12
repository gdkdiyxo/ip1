<%@page import="com.ict.trust.vbct.model.StudentInfoBo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
      
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%List<StudentInfoBo> lst1=(List<StudentInfoBo>)request.getAttribute("list");

%>
<script type="text/javascript">
 $(document).ready(function() {
  alert("hie");
      <%
      List<StudentInfoBo> lst2=(List<StudentInfoBo>)request.getAttribute("list");

  System.out.println(lst2.get(0).getSemester());
     
     
      if(lst2.get(0).getGender().equals("MALE"))
      {%>
      alert("hie");
      $("#male").prop("checked", true);
      
     <% }%>
     <%
    if(lst2.get(0).getGender().equals("FEMALE"))
      {%>
      alert("hie");
      $("#female").prop("checked", true);
      
     <% }%>
     <%
      if(lst2.get(0).getSemester().equals("FALL"))
      {%>
      alert("hie");
      $("#fall").prop("checked", true);
      
     <% }%>
     <%
    if(lst2.get(0).getGender().equals("WINTER"))
      {%>
      alert("hie");
      $("#winter").prop("checked", true);
      
     <% }%>
      
      
              
      

} );

</script>
</head>
<body>

<form:form modelAttribute="StudentInfo">
 
   <h3>Student Basic Info</h3>
  <div>
   <table align="center">
<tr>
	<td> Semester  :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input TYPE="radio" NAME="info.semester" id="fall" VALUE="FALL" > FALL
	<input TYPE="radio" NAME="info.semester" id="winter" VALUE="WINTER"  > WINTER
	
	</td>
	
	<td> Year :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.year" id="year" value="<%=lst1.get(0).getYear()%>"    "allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="year1">You can't leave this empty</span>
	</td>
</tr>
<tr>
   <td> Student ID :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.student_id" id="student_id" value="<%=lst1.get(0).getStudent_id()%>" onchange="alphanumber();allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="student_id1">You can't leave this empty</span>
	</td>
	<td> First Name :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.fname" id="fname" value="<%=lst1.get(0).getFname()%>" onchange="alphanumber();allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="fname1">You can't leave this empty</span>
	</td>
	
	
</tr>

<tr>
<td> Middle Name :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.mname" id="mname" onchange="allHide(this);" value="<%=lst1.get(0).getMname()%>" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="mname1">You can't leave this empty</span>
	</td>
	<td> Last Name :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.lname" id="lname" onchange="allHide(this);" value="<%=lst1.get(0).getLname()%>" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="lname1">You can't leave this empty</span>
	</td>
	
	
</tr>

<tr>
<td> Email  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.stu_email" id="stu_email" onchange="allHide(this);" value="<%=lst1.get(0).getStu_email()%>" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="stu_email1">You can't leave this empty</span>
	</td>
	<td> Telephone :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.stu_telephone" id="stu_telephone" onchange="allHide(this);" value="<%=lst1.get(0).getStu_telephone()%>" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="stu_telephone1">You can't leave this empty</span>
	</td>
	
	
</tr>
<tr>
<td> Gender  <font size="2" style="color: red;">*</font></td>
	<td> 
	
	<input TYPE="radio" NAME="info.semester" id="male" VALUE="MALE" checked="checked"> MALE
	<input TYPE="radio" NAME="info.semester" id="female" VALUE="FEMALE"  > FEMALE
		<span style="display: none;color: red;font-size: 12px;" id="gender1">You can't leave this empty</span>
	
	</td>
	
	<td> Status :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.canada_status" id="canada_status" onchange="allHide(this);" value="<%=lst1.get(0).getCanada_status()%>" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="canada_status1">You can't leave this empty</span>
	</td>
	
	
</tr>
<tr>
<td> Country  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.country" id="country" onchange="allHide(this);" value="<%=lst1.get(0).getCountry()%>" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="gender1">You can't leave this empty</span>
	</td>
</tr>
</table>
<table align="center">
<tr align="center">
	<td style="padding-top: 12px;">
	<input type="button" value="Update" style="cursor: pointer;" onclick="updatestudentinfo();"/>
	</td>
	<td  style="padding-top: 12px;">
	<input type="reset" value="Reset" style="cursor: pointer;"/>
	</td>
</tr>

</table>
</div>
</form:form>
</body>
</html>