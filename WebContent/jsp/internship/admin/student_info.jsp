<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script src="<c:url value="/js/allvalidation.js" />"></script>
  
  <script>
  $(function() {
    $( "#accordion" ).accordion();
  });
  </script>
  <script type="text/javascript">
     	
    jQuery(document).ready(function() {
        var id = 0;
      jQuery("#addrow").click(function() {
        id++;           
        var row = jQuery('#firstrow').clone(true);
        var row1 = jQuery('#secondrow').clone(true);
        var row2 = jQuery('#thirdrow').clone(true);
        row.find("input:text").val("");
        row.attr('id',id); 
        row.appendTo('#dynamicTable1');  
        row1.find("input:text").val("");
        row1.attr('id',id); 
        row1.appendTo('#dynamicTable1');  
        row2.find("input:text").val("");
        row2.attr('id',id); 
        row2.appendTo('#dynamicTable1');        
        return false;
    });        
        
  $('.remove').on("click", function() {
  $(this).parents("tr").remove();
});
});

  
  </script>
  <script type="text/javascript">
     	
    jQuery(document).ready(function() {
        var id = 0;
      jQuery("#addrowcerti").click(function() {
        id++;           
        var row = jQuery('#firstrowcerti').clone(true);
      
        row.find("input:text").val("");
        row.attr('id',id); 
        row.appendTo('#certificate_table');  
             
        return false;
    });        
        
 
});


  
  </script>
  <script type="text/javascript">
  
    jQuery(document).ready(function() {
        var id = 0;
      jQuery("#addrowwork").click(function() {
        id++;           
        var row = jQuery('.samplerowwork tr').clone(true);
        row.find("input:text").val("");
        row.attr('id',id); 
        row.appendTo('#dynamicTable1work');        
        return false;
    });        
        

});

  
  </script>
<script>
function save()
{
var flag = true;
	if(document.getElementById("year").value == "")
	{
		document.getElementById("year1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("student_id").value == "")
	{
		document.getElementById("student_id1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("gender").value == "")
	{
		document.getElementById("gender1").style.display = "block";
		flag = false;
	}
	
	if(document.getElementById("fname").value == "")
	{
		document.getElementById("fname1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("lname").value == "")
	{
		document.getElementById("lname1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("mname").value == "")
	{
		document.getElementById("mname1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("stu_email").value == "")
	{
		document.getElementById("stu_email1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("stu_telephone").value == "")
	{
		document.getElementById("stu_telephone1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("canada_status").value == "")
	{
		document.getElementById("canada_status1").style.display = "block";
		flag = false;
	}
   if(document.getElementById("country").value == "")
	{
		document.getElementById("country1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("stu_telephone").value == "")
	{
		document.getElementById("stu_telephone1").style.display = "block";
		flag = false;
	}
	
	if(document.getElementById("degree_type").value == "select" )
	{
		document.getElementById("degree_type1").style.display = "block";
		flag = false;
	}
    if(document.getElementById("major").value == "")
	{
		document.getElementById("major1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("degree_gpa").value == "")
	{
		document.getElementById("degree_gpa1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("university").value == "")
	{
		document.getElementById("university1").style.display = "block";
		flag = false;
	}
    if(document.getElementById("university_location").value == "")
	{
		document.getElementById("university_location1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("certificate_title").value == "")
	{
		document.getElementById("certificate_title1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("certificate_body").value == "")
	{
		document.getElementById("certificate_body1").style.display = "block";
		flag = false;
	}
    if(document.getElementById("company").value == "")
	{
		document.getElementById("company1").style.display = "block";
		flag = false;
	}
    if(document.getElementById("start_date").value == "")
	{
		document.getElementById("start_date1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("position").value == "")
	{
		document.getElementById("position1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("company_location").value == "")
	{
		document.getElementById("company_location1").style.display = "block";
		flag = false;
	}

	if(flag)

{
	document.home.action = "saveDemo.htm";
	document.home.submit();
}
}

function allHide(msg)
{
	document.getElementById(msg.id+"1").style.display = "none";
}
</script>
</head>
<body>
<form:form modelAttribute="common">
<div id="accordion">
  <h3>Student Basic Info</h3>
  <div>
   <table align="center">
<tr>
	<td> Semester  :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input TYPE="radio" NAME="info.semester" VALUE="FALL" checked="checked"> FALL
	<input TYPE="radio" NAME="info.semester" VALUE="WINTER"  > WINTER
	
	</td>
	
	<td> Year :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.year" id="year" onchange="onlynumbers(this);allHide(this);"  onblur="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="year1">You can't leave this empty</span>
	</td>
</tr>
<tr>
   <td> Student ID :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.student_id" id="student_id" onchange="alphanumber(this);allHide(this);"  onblur="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="student_id1">You can't leave this empty</span>
	</td>
	<td> First Name :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.fname" id="fname" onchange="onlyalphabet(this);allHide(this);"  onblur="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="fname1">You can't leave this empty</span>
	</td>
	
	
</tr>

<tr>
<td> Middle Name :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.mname" id="mname" onchange="onlyalphabet(this);allHide(this);"  onblur="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="mname1">You can't leave this empty</span>
	</td>
	<td> Last Name :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.lname" id="lname" onchange="onlyalphabet(this);allHide(this);"  onblur="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="lname1">You can't leave this empty</span>
	</td>
	
	
</tr>

<tr>
<td> Email  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.stu_email" id="stu_email" onchange="validateEmail(this);allHide(this);"  onblur="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="stu_email1">You can't leave this empty</span>
	</td>
	<td> Telephone :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.stu_telephone" id="stu_telephone" onchange="onlynumbers(this);allHide(this);"  onblur="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="stu_telephone1">You can't leave this empty</span>
	</td>
	
	
</tr>
<tr>
<td> Gender  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.gender" id="gender" onchange="allHide(this);"  onblur="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="gender1">You can't leave this empty</span>
	</td>
	<td> Status :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.canada_status" id="canada_status" onchange="onlyalphabet(this);allHide(this);"  onblur="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="canada_status1">You can't leave this empty</span>
	</td>
	
	
</tr>
<tr>
<td> Country  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.country" id="country" onchange="allHide(this);" onclick="allHide(this);"  onblur="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="country1">You can't leave this empty</span>
	</td>
</tr>
</table>
  </div>
  <h3>Student Education</h3>
  <div>
    <table align="center" class="samplerow" id="dynamicTable1">
    
    <tr id="firstrow">
	<td> Degree Type :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<select  id=degree_type name="edu.degree_type" onchange="allHide(this);" onclick="allHide(this);"  onblur="allHide(this);">
	<option label="--Select--" value="select" selected="selected">Select</option>
	<option  value="Graduate">Graduate</option>
	<option value="Undergraduate" >Undergraduate</option>
	
	
	</select>	<span style="display: none;color: red;font-size: 12px;" id="degree_type1">You can't leave this empty</span>
	</td>
	
	<td> Major :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="edu.major" id="major" onchange="aplhaspecial(this);allHide(this);" onclick="allHide(this);"  onblur="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="major1">You can't leave this empty</span>
	</td>
	<td> GPA :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="edu.degree_gpa" id="degree_gpa" onchange="alphanumber(this);allHide(this);" onclick="allHide(this);"  onblur="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="degree_gpa1">You can't leave this empty</span>
	</td>
</tr>

 <tr id="secondrow" >
	
	
	<td> University :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="edu.university" id="university" onchange="allHide(this);" onclick="allHide(this);"  onblur="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="university1">You can't leave this empty</span>
	</td>
	<td> Location :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="edu.university_location" id="university_location" onchange="alphanumber();allHide(this);" onclick="allHide(this);"  onblur="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="university_location1">You can't leave this empty</span>
	</td>
	
	<!-- <td> Date :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="info.mname" id="mname" onchange="allHide(this);" onclick="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="mname1">You can't leave this empty</span>
	</td> -->
</tr>
    
  <tr id="thirdrow">
	<td> </td>
	<td></td>
</tr>   
    
    </table>
    <table>
    
      <tr >
		  <td>  <input type="button" id="addrow" value="Add"></td>
		   
	<td></td>
</tr> 
    </table>
  </div>
  <h3>Student Certificate</h3>
  <div>
    

  <table id="certificate_table" >
  <tr id="firstrowcerti">
	<td> Certificate Title :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="certi.certificate_title" id="certificate_title" onchange="alphanumber();allHide(this);" onclick="allHide(this);"  onblur="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="certificate_title1">You can't leave this empty</span>
	</td>
	
	<td> Certificate Body :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="certi.certificate_body" id="certificate_body" onchange="allHide(this);" onclick="allHide(this);"  onblur="allHide(this);">
	<span style="display: none;color: red;font-size: 12px;" id="certificate_body1">You can't leave this empty</span>
	</td>

</tr>
  </table>
    <table>
    
      <tr >
		  <td>  <input type="button" id="addrowcerti" value="Add"></td>
		   
	<td></td>
</tr> 
    </table>
  </div>
  <h3>Student Work  Experience</h3>
  <div>
    <table id="dynamicTable1work">
        <tr>
            <td>Company <font size="2" style="color: red;">*</font></td>
            <td>Dates(MM/YY-MM/YY) <font size="2" style="color: red;">*</font></td>
            <td>Title <font size="2" style="color: red;">*</font></td>
            <td>Compny Location <font size="2" style="color: red;">*</font></td>
            
        </tr>
      <tr id="0">
        <td><input type="text" id="company" name="work.company" onchange="alphanumber();allHide(this);" onclick="allHide(this);"  onblur="allHide(this);"/>	
        <span style="display: none;color: red;font-size: 12px;" id="company1">You can't leave this empty</span>
        </td>
        <td><input type="text" id="start_date" name="work.start_date" onchange="alphanumber();allHide(this);" onclick="allHide(this);"  onblur="allHide(this);"/>	
        <span style="display: none;color: red;font-size: 12px;" id="start_date1">You can't leave this empty</span>
        </td>
        <td><input type="text" id="position" name="work.position" onchange="alphanumber();allHide(this);" onclick="allHide(this);"  onblur="allHide(this);"/>	
        <span style="display: none;color: red;font-size: 12px;" id="position1">You can't leave this empty</span>
        </td>
        <td><input type="text" id="company_location" name="work.company_location"onchange="alphanumber();allHide(this);" onclick="allHide(this);"  onblur="allHide(this);"/>	
        	<span style="display: none;color: red;font-size: 12px;" id="company_location1">You can't leave this empty</span>
        </td>
       
      </tr>
    </table>

  <input type="button" id="addrowwork" value="Add New Row" />

  <table class="samplerowwork" style="display:none">
      <tr>
        <td><input type="text" id="company" name="work.company"/></td>
        <td><input type="text" id="start_date" name="work.start_date"/></td>
        <td><input type="text" id="position" name="work.position"/></td>
        <td><input type="text" id="company_location" name="work.company_location"/></td>
       
      </tr>
  </table>
  </div>
</div>
 <div align="center">
		<input value="Submit" onclick="save();" type="button">
		<input value="Reset" style="margin-left: 5px" type="reset">
		</div>
</form:form>
</body>
</html>