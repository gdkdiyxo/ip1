<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/allvalidation.js"></script>

<script type="text/javascript">
function saveinternship()
{
document.home.action = "saveinternship.htm";
		document.home.submit();
	/* var flag = true;
	if(document.getElementById("title").value == "")
	{
		document.getElementById("title1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("year").value == "Select")
	{
		document.getElementById("year1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("tempid").value == "")
	{
		document.getElementById("tempid1").style.display = "block";
		flag = false;
	}
	if(flag)
	{ */
		
	/* } */
}

function allHide(msg)
{
	document.getElementById(msg.id+"1").style.display = "none";
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Internship</title>
</head>
<body>
<form:form modelAttribute="AddInternship">
<h1 align="center">Add Internship Type</h1>
<br>
<div class="formdesign">
<div><h4 align="center" style="margin: 5px 2px;color: #961200;">Add new Internship</h4>
			<span id="notice" style="font-size: 12px; color: red; display: block; align:right">* Mandatory fields</span></div>
<table align="center">
<tr>
	<td> Internship  Name :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="internship_name" id="internship_name" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="internship_name">You can't leave this empty</span>
	</td>
	<td> Description :  <font size="2" style="color: red;">*</font></td>
	<td>
		<input type="text" name="description" id="description" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="skill_name1">You can't leave this empty</span>
	</td> 
</tr>
<tr>
	

</table>
</div>

<table align="center">
<tr align="center">
	<td style="padding-top: 12px;">
	<input type="button" value="Submit" style="cursor: pointer;" onclick="saveinternship();"/>
	</td>
	<td  style="padding-top: 12px;">
	<input type="reset" value="Reset" style="cursor: pointer;"/>
	</td>
</tr>

</table>

</form:form>
</body>
</html>