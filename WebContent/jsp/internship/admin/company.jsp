<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/allvalidation.js"></script>

<script type="text/javascript">
function saveCompany()
{
document.home.action = "savecompany.htm";
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
<form:form modelAttribute="AddCompany">
<h1 align="center">Add Company</h1>
<br>
<div class="formdesign">
<div><h4 align="center" style="margin: 5px 2px;color: #961200;">Add new Company</h4>
			<span id="notice" style="font-size: 12px; color: red; display: block; align:right">* Mandatory fields</span></div>
<table align="center">
<tr>
	<td> Company Name :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="company_name" id="company_name" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="company_name1">You can't leave this empty</span>
	</td>
	
	<td> Address :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="address" id="address" onchange="validateaddress(this);allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="address1">You can't leave this empty</span>
	</td>
</tr>
<tr>
	<td> City :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="city" id="city" onchange="alphanumber();allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="city1">You can't leave this empty</span>
	</td>
	
	<td> Postal Code :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="postal_code" id="postal_code" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="postal_code1">You can't leave this empty</span>
	</td>
</tr>

<tr>
	<td> Country :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="country" id="country" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="country1">You can't leave this empty</span>
	</td>
	
	<td> Contact Person First Name  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="contact_pearson_fname" id="contact_pearson_fname" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="contact_pearson_fname1">You can't leave this empty</span>
	</td>
</tr>

<tr>
	<td> Contact Person Last Name :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="contact_person_lname" id="contact_person_lname" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="contact_person_lname1">You can't leave this empty</span>
	</td>
	
	<td> Contact Person Position  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="contact_pearson_position" id="contact_pearson_position" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="contact_pearson_position1">You can't leave this empty</span>
	</td>
</tr>
<tr>
	<td> Telephone :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="telephone" id="telephone" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="telephone1">You can't leave this empty</span>
	</td>
	
	<td> Email:  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="email" id="email" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="email1">You can't leave this empty</span>
	</td>
</tr>
<tr>
	<td> Company's Website :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="company_website" id="company_website" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="company_website1">You can't leave this empty</span>
	</td>
	<td></td>
	<td></td>
	</tr>
	<tr>
	<td> Notes:  <font size="2" style="color: red;">*</font></td>
	<td> 
	<TEXTAREA NAME="notes" id="notes" ROWS="5"></TEXTAREA>
	<span style="display: none;color: red;font-size: 12px;" id="notes1">You can't leave this empty</span>
	</td>
</tr>
<!-- <tr><td colspan="2" style="padding-top: 5px;"></td></tr>
<tr>
	<td> Year : <font size="2" style="color: red;">*</font></td>
	<td>
	<select name="sheet_year" id="year" onclick="allHide(this);" onchange="allHide(this);">
	<option value="Select" selected="selected">--Select--</option>
	
		
	
	</select>
	 <input type="text" name="sheet_year" maxlength="4" id="year" onchange="yearlength(this);allHide(this);" onclick="allHide(this);"> 
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
</tr> -->
</table>
</div>

<table align="center">
<tr align="center">
	<td style="padding-top: 12px;">
	<input type="button" value="Submit" style="cursor: pointer;" onclick="saveCompany();"/>
	</td>
	<td  style="padding-top: 12px;">
	<input type="reset" value="Reset" style="cursor: pointer;"/>
	</td>
</tr>

</table>

</form:form>
</body>
</html>