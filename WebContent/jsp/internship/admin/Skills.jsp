<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/allvalidation.js"></script>

<script type="text/javascript">
function saveSkill()
{
alert('hie');
document.home.action = "saveSkill.htm";
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
<title>Add Skill</title>
</head>
<body>
<form:form modelAttribute="AddSkill">
<h1 align="center">Add Skill</h1>
<br>
<div class="formdesign">
<div><h4 align="center" style="margin: 5px 2px;color: #961200;">Add new Skill</h4>
			<span id="notice" style="font-size: 12px; color: red; display: block; align:right">* Mandatory fields</span></div>
<table align="center">
<tr>
	<td> Skill Name :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="skill_name" id="skill_name" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="skill_name1">You can't leave this empty</span>
	</td>
	<td> Skill Type :  <font size="2" style="color: red;">*</font></td>
	<td>
	<select id="skill_type" name="skill_type" onclick="allHide(this);" onchange="allHide(this);">
	<option selected="selected">Select</option>
  <option value="Technical">Technical</option>
  <option value="CMS" >CMS</option>
  <option value="Operating System">Operating System</option>
</select>
	<span style="display: none;color: red;font-size: 12px;" id="skill_type1">You can't leave this empty</span>
	</td> 
</tr>
<tr>
	

</table>
</div>

<table align="center">
<tr align="center">
	<td style="padding-top: 12px;">
	<input type="button" value="Submit" style="cursor: pointer;" onclick="saveSkill();"/>
	</td>
	<td  style="padding-top: 12px;">
	<input type="reset" value="Reset" style="cursor: pointer;"/>
	</td>
</tr>

</table>

</form:form>
</body>
</html>