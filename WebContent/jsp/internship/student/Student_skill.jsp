<%@page import="com.ict.trust.vbct.model.SkillBo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/allvalidation.js"></script>
  <link rel='Stylesheet' type='text/css'
href='//cdnjs.cloudflare.com/ajax/libs/select2/3.4.6/select2.css' />
 
<script type='text/javascript'
src='//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'></script>
 
<script type='text/javascript'
src='//cdnjs.cloudflare.com/ajax/libs/select2/3.4.6/select2.js'></script>
  
<script type="text/javascript">
function saveStudentskill()
{

document.home.action = "saveStudentskill.htm";
		document.home.submit();
		}
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
 $(document).ready(function() {
    $('#student_id').select2();
   
      
} );


function allHide(msg)
{
	document.getElementById(msg.id+"1").style.display = "none";
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Skills</title>
</head>
<body>
<form:form modelAttribute="StudentSkill">
<h1 align="center">Student Skills</h1>
<br>
<div class="formdesign">
<div><h4 align="center" style="margin: 5px 2px;color: #961200;">Student Skill</h4>
			<span id="notice" style="font-size: 12px; color: red; display: block; align:right">* Mandatory fields</span></div>
<table align="center">
<tr>
<td>
	 <select style="width:300px" name='student_id' id='student_id' size='10' multiple='multiple' 
                class='required'>
       <option label="--Select--" value="" >Select</option>
	<% List<SkillBo> lst=(List<SkillBo>)request.getAttribute("skill_list");
	for(int i=0;i<lst.size();i++)
	{
	 %>
	<option value="<%=lst.get(i).getSkill_id()%>"> <%= lst.get(i).getSkill_name()%></option>
	<%} %>
    </select>
	</td>
</tr>

	

</table>
</div>

<table align="center">
<tr align="center">
	<td style="padding-top: 12px;">
	<input type="button" value="Submit" style="cursor: pointer;" onclick="saveStudentskill();"/>
	</td>
	<td  style="padding-top: 12px;">
	<input type="reset" value="Reset" style="cursor: pointer;"/>
	</td>
</tr>

</table>

</form:form>
</body>
</html>