<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Balance Sheet</title>

<script type="text/javascript">
function saveBalanceSheet()
{
	var flag = true;
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
	{
		document.adminform.action = "saveBalanceSheet.htm";
		document.adminform.submit();
	}
}

function allHide(msg)
{
	document.getElementById(msg.id+"1").style.display = "none";
}
</script>

<script type="text/javascript">
window.onload=function(){

var end = new Date().getFullYear();

var start = end-10;



var options = "";

options += "<option value=\"Select\" selected=\"selected\">"+ "--Select--" +"</option>";

for(var year = end ; year >=start; end--){
  options += "<option>"+Number(end)+"-"+Number(end+1)+"</option>";
  start++;
}

  

document.getElementById("year").innerHTML = options;
changeclass();
}  

</script>


</head>
<body>
<form:form modelAttribute="BalanceSheet">
<h1 align="center">Add Company</h1>
<input type="hidden" name="sheet_data" id="sheet_data" />
<br>
<div class="formdesign">
<div><h4 align="center" style="margin: 5px 2px;color: #961200;">Add new balance sheet</h4>
			<span id="notice" style="font-size: 12px; color: red; display: block; align:right">* Mandatory fields</span></div>
<table align="center">
<tr>
	<td> Title :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="sheet_title" id="title" onchange="validateaddress(this);allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="title1">You can't leave this empty</span>
	</td>
</tr>
<tr><td colspan="2" style="padding-top: 5px;"></td></tr>
<tr>
	<td> Year : <font size="2" style="color: red;">*</font></td>
	<td>
	<select name="sheet_year" id="year" onclick="allHide(this);" onchange="allHide(this);">
<!-- 	<option value="Select" selected="selected">--Select--</option> -->
	
		
	
	</select>
<!-- 	 <input type="text" name="sheet_year" maxlength="4" id="year" onchange="yearlength(this);allHide(this);" onclick="allHide(this);">  -->
	<span style="display: none;color: red;font-size: 12px;" id="year1">You can't leave this empty</span>
	</td> 
</tr>
<tr><td colspan="2" style="padding-top: 5px;"></td></tr>
<tr>
	<td> Upload Sheet : <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="file" id="tempid" name="file" onchange="checkFile5MB_pdf(this);allHide(this);" onclick="allHide(this);"/>
	<span style="display: none;color: red;font-size: 12px;" id="tempid1">You can't leave this empty</span>
	</td>
</tr>
</table>
</div>

<table align="center">
<tr align="center">
	<td style="padding-top: 12px;">
	<input type="button" value="Submit" style="cursor: pointer;" onclick="saveBalanceSheet();"/>
	</td>
	<td  style="padding-top: 12px;">
	<input type="reset" value="Reset" style="cursor: pointer;"/>
	</td>
</tr>

</table>

</form:form>
</body>
</html>