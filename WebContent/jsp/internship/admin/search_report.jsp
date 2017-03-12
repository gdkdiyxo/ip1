<%@page import="com.ict.trust.vbct.model.ReportlistBo"%>
<%@page import="com.ict.trust.vbct.model.InternshipTypeBo"%>
<%@page import="com.ict.trust.vbct.model.StudentInfoBo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function searchreport()
{
document.home.action = "searchreport.htm";
document.home.submit();
}
</script>
</head>
<body>
<form:form modelAttribute="SearchReport">
<h1 align="center">Search Student</h1>
<br>
<div class="formdesign">
<div><h4 align="center" style="margin: 5px 2px;color: #961200;">Search Student</h4>
</div>
<table align="center">
<tr>
	<td> country: </td>
	<td>
	<select  id="country" name="country">
	<option label="--ALL--" value="" selected="selected">Select</option>
	<% List<ReportlistBo> lst2=(List<ReportlistBo>)request.getAttribute("country");
	for(int i=0;i<lst2.size();i++)
	{
	 %>
	<option value="<%=lst2.get(i).getCountry()%>"><%=lst2.get(i).getCountry() %></option>
	<%} %>
	</select>

	<span style="display: none;color: red;font-size: 12px;" id="country1">You can't leave this empty</span>
	</td>
	<td> Student Status : </td>
	<td>
	<select id="student_status" name="student_status" onclick="allHide(this);" onchange="allHide(this);">
	<option selected="selected" value="">--ALL--</option>
  <option value="Hired">Hired</option>
  <option value="Available" >Available</option>
</select>
	<span style="display: none;color: red;font-size: 12px;" id="student_status1">You can't leave this empty</span>
	</td> 
</tr>
<tr>
	<td> Internship Type: </td>
	<td>
	<select id="internship_type" name="internship_type" onclick="allHide(this);" onchange="allHide(this);">
	<option value="">--ALL--</option>
  <option value="Paid">Paid</option>
  <option value="Unpaid" >Unpaid</option>
</select>
	<span style="display: none;color: red;font-size: 12px;" id="internship_type1">You can't leave this empty</span>
	</td> 	<td>Year : </td>
	<td>
	<select  id="year" name="year">
	<option label="--ALL--" value="" selected="selected">Select</option>
	<% List<ReportlistBo> lst=(List<ReportlistBo>)request.getAttribute("year");
	for(int i=0;i<lst.size();i++)
	{
	 %>
	<option value="<%=lst.get(i).getYear()%>"><%=lst.get(i).getYear() %></option>
	<%} %>
	</select>

	<span style="display: none;color: red;font-size: 12px;" id="internship_id1">You can't leave this empty</span>
	</td> 
</tr>
<tr>
	<td> Semester:</td>
	<td> 
	<select id="semester" name="semester" onclick="allHide(this);" onchange="allHide(this);">
	<option value="">--ALL--</option>
  <option value="FALL">Fall</option>
  <option value="WINTER" >Winter</option>
</select>
	</td>
</tr>
</table>
</div>

<table align="center">
<tr align="center">
	<td style="padding-top: 12px;">
	<input type="button" value="Submit" style="cursor: pointer;" onclick="searchreport();"/>
	</td>
	<td  style="padding-top: 12px;">
	<input type="reset" value="Reset" style="cursor: pointer;"/>
	</td>
</tr>

</table>

</form:form>
</body>
</html>