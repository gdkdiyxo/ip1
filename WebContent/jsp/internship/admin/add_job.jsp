<%@page import="com.ict.trust.vbct.model.SkillBo"%>
<%@page import="com.ict.trust.vbct.model.CompanyBo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/allvalidation.js"></script>

<script type="text/javascript">
function savejob()
{
document.home.action = "savejob.htm";
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
<title>Insert title here</title>
</head>
<body>
<form:form modelAttribute="AddJob">
<h1 align="center">Add Job</h1>
<br>
<div class="formdesign">
<div><h4 align="center" style="margin: 5px 2px;color: #961200;">Add new Job</h4>
			<span id="notice" style="font-size: 12px; color: red; display: block; align:right">* Mandatory fields</span></div>
<table align="center">
<tr>
<td>job Skill :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<select  id="job_skill" name="job_skill">
	<option label="--Select--" value="" selected="selected">Select</option>
	<% List<SkillBo> lst1=(List<SkillBo>)request.getAttribute("skill");
	for(int i=0;i<lst1.size();i++)
	{
	 %>
	<option value="<%=lst1.get(i).getSkill_id()%>"> <%= lst1.get(i).getSkill_name()%></option>
	<%} %>
	</select>
	</td>
	<td>Job position :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="job_position" id="job_position" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="job_position1">You can't leave this empty</span>
	</td>
	
	</tr>
	<tr>
	<td>Salary :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="salary" id="salary" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="job_position1">You can't leave this empty</span>
	</td>
	<td> Description:  <font size="2" style="color: red;">*</font></td>
	<td> 
	<TEXTAREA NAME="description" id="notes" ROWS="5"></TEXTAREA>
	<span style="display: none;color: red;font-size: 12px;" id="description1">You can't leave this empty</span>
	</td>
	
</tr>

<tr>
	<td> Requirements:  <font size="2" style="color: red;">*</font></td>
	<td> 
	<TEXTAREA NAME="requirements" id="requirements" ROWS="5"></TEXTAREA>
	<span style="display: none;color: red;font-size: 12px;" id="description1">You can't leave this empty</span>
	</td>
	
	<td>Company Name :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<select  id="company_id" name="company_id">
	<option label="--Select--" value="" selected="selected">Select</option>
	<% List<CompanyBo> lst=(List<CompanyBo>)request.getAttribute("lst");
	for(int i=0;i<lst.size();i++)
	{
	 %>
	<option value="<%=lst.get(i).getCompany_id()%>"> <%= lst.get(i).getCompany_name() %></option>
	<%} %>
	</select>
	</td>
	
</tr>
<tr>
<td> Responsibilities:  <font size="2" style="color: red;">*</font></td>
	<td> 
	<TEXTAREA NAME="responsibilities" id="responsibilities" ROWS="5"></TEXTAREA>
	<span style="display: none;color: red;font-size: 12px;" id="responsibilities1">You can't leave this empty</span>
	</td>
	
</tr>
</table>
</div>

<table align="center">
<tr align="center">
	<td style="padding-top: 12px;">
	<input type="button" value="Submit" style="cursor: pointer;" onclick="savejob();"/>
	</td>
	<td  style="padding-top: 12px;">
	<input type="reset" value="Reset" style="cursor: pointer;"/>
	</td>
</tr>

</table>

</form:form>
</body>
</html>
