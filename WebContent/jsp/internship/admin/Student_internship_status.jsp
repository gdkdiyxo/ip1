<%@page import="com.sun.org.apache.bcel.internal.generic.LSTORE"%>
<%@page import="com.ict.trust.vbct.model.InternshipTypeBo"%>
<%@page import="com.ict.trust.vbct.model.JobBo"%>
<%@page import="com.ict.trust.vbct.model.CompanyBo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>

<script>

$(document).ready(function() {
    $('#company_id').change(function(event) {  
    alert("hie");
    var $company_id=$("select#company_id").val();
    alert($company_id);
       $.get('getjobfromcompanyajax.htm',{company_id:$company_id},function(responseJson) {   
           var $select = $('#job_id');                           
           $select.find('option').remove(); 

           $.each(responseJson, function(index, name) {               
               $('<option>').val(index).text(name).appendTo($select);      
                });
        });
    });
   
     });
     
/* $(document).ready(function() {

    $('#company_id').change(function(event) {  
    alert("hie");
    var $company_id=$("select#company_id").val();
    alert($company_id);
       $.get('getjobfromcompanyajax.htm',{company_id:$company_id},function(responseJson) {   
           var $select = $('#job_id');                           
           $select.find('option').remove(); 

           $.each(responseJson, function(index, name) {               
               $('<option>').val(index).text(name).appendTo($select);      
                });
        });
    });
     }); */
  /*   $('#job_id').change(function(event) {  
          var $company_id=$("select#company_id").val();
     
     $.ajax({
     
         url: 'getjobfromcompanyajax.htm',
         type: 'POST',
         dataType: 'json',
         data: {company_id: $company_id},
         
         success: function(data){
             alert(data); // alert not working
             }
      });
          }); */
      
</script>
<script type="text/javascript">
function saveInternship_status() {
	document.home.action = "saveInternship_status.htm";
	document.home.submit();
}
</script>
</head>
<body>
<form:form modelAttribute="AddStudentInternship">
<h1 align="center">Student Internship Status</h1>
<br>
<div class="formdesign">
<div><h4 align="center" style="margin: 5px 2px;color: #961200;">Student Internship Status</h4>
			<span id="notice" style="font-size: 12px; color: red; display: block; align:right">* Mandatory fields</span></div>
<table align="center">
<tr>
	<td> Student Id :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<input type="text" name="student_id" id="student_id" value="<%=request.getAttribute("studentid")%>">
	<span style="display: none;color: red;font-size: 12px;" id="student_id1">You can't leave this empty</span>
	</td>
<%-- 	<td> Company Name :  <font size="2" style="color: red;">*</font></td>
	<td>
	<select  id="company_id" name="company_id">
	<option label="--Select--" value="1" selected="selected">Select</option>
	<% List<CompanyBo> lst=(List<CompanyBo>)request.getAttribute("lst");
	for(int i=0;i<lst.size();i++)
	{
	 %>
	<option value="<%=lst.get(i).getCompany_id()%>"> <%= lst.get(i).getCompany_name() %></option>
	<%} %>
	</select>

	<span style="display: none;color: red;font-size: 12px;" id="company_id1">You can't leave this empty</span>
	</td>  --%>
	
</tr>
<tr>
	<td> Internship Type :  <font size="2" style="color: red;">*</font></td>
	<td> 
<select  id=internship_type name="internship_type">
	<option label="--Select--" value="" selected="selected">Select</option>
	<option  value="Paid">Paid</option>
	<option value="Unpaid" >Unpaid</option>
	
	
	</select>	<span style="display: none;color: red;font-size: 12px;" id="internship_type1">You can't leave this empty</span>
	</td>
	<%-- <td> Job  :  <font size="2" style="color: red;">*</font></td>
	<td>
	<select  id="job_id" name="job_id">
	<option label="--Select--" value="1" selected="selected">Select</option>
	</select>
	<% List<JobBo> lst1=(List<JobBo>)request.getAttribute("lst1");
	for(int i=0;i<lst1.size();i++)
	{
	 %>
	<option value="<%=lst1.get(i).getJob_id()%>"> <%= lst1.get(i).getJob_position()%></option>
	<%} %>
	</select>

	<span style="display: none;color: red;font-size: 12px;" id="job_id1">You can't leave this empty</span>
	</td> 
	 --%>
</tr>
<tr>
	
<tr>
	
	<td> Internship type:  <font size="2" style="color: red;">*</font></td>
	<td>
	<select  id="internship_id" name="internship_id">
	<option label="--Select--" value="1" selected="selected">Select</option>
	<% List<InternshipTypeBo> lst2=(List<InternshipTypeBo>)request.getAttribute("i");
	for(int i=0;i<lst2.size();i++)
	{
	 %>
	<option value="<%=lst2.get(i).getId()%>"><%=lst2.get(i).getInternship_name() %></option>
	<%} %>
	</select>

	<span style="display: none;color: red;font-size: 12px;" id="internship_id1">You can't leave this empty</span>
	</td> 
	
</tr>
<tr>
</table>
</div>

<table align="center">
<tr align="center">
	<td style="padding-top: 12px;">
	<input type="button" value="Submit" style="cursor: pointer;" onclick="saveInternship_status();"/>
	</td>
	<td  style="padding-top: 12px;">
	<input type="reset" value="Reset" style="cursor: pointer;"/>
	</td>
</tr>

</table>

</form:form>
</body>
</html>