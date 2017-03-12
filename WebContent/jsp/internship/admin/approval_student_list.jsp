<%@page import="com.ict.trust.vbct.model.ApprovalStudentBo"%>
<%@page import="com.ict.trust.vbct.model.StudentInfoBo"%>
<%@page import="com.ict.trust.vbct.model.JobBo"%>
<%@page import="com.ict.trust.vbct.model.CompanyBo"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
      <link href="<c:url value="/css/jquery.dataTables.min.css" />" rel="stylesheet">
 
    <script src="<c:url value="/js/jquery.dataTables.min.js" />"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable();
} );

function fun(stu_id,company_id,job_id,job_position,company_name) {
var stu_id1=stu_id;
var company_id1=company_id;
var job_id1=job_id;
var job_position1=job_position;
var company_name1=company_name;

document.getElementById('student_id').value=stu_id1;
document.getElementById('company_id').value=company_id1;
document.getElementById('job_id').value=job_id1;
document.getElementById('job_position').value=job_position1;
document.getElementById('company_name').value=company_name1;

document.home.action = "insert_company_student_status.htm";
 	document.home.submit();

}
</script>
</head>
<body>


<form:form >
<div id="pdfdiv">
<fieldset>
<h1 align="center">Approved Student List</h1>
<table id="example" class="display" cellspacing="0" width="100%" border="1" align="center">

        <thead>
            <tr>
                
            
                <th>Student ID</th>
                <th> Name</th>
                <th>Company Name</th>
                <th>Job position</th>
                
               
            </tr>
        </thead>
        <tbody>
      <%List<ApprovalStudentBo> lst=(List<ApprovalStudentBo>)request.getAttribute("info");
     int index=1;
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr align="center">
                <td ><a href="#" onclick="javascript:fun('<%=lst.get(i).getStudent_id()%>','<%=lst.get(i).getCompany_id() %>','<%=lst.get(i).getJob_id()%>','<%=lst.get(i).getJob_position()%>','<%=lst.get(i).getCompany_name()%>')" style="color: #CC0000" ><%=lst.get(i).getStudent_id() %></a></td>
                <td><%=lst.get(i).getFname()+" "+ lst.get(i).getLname()%></td>
                <td><%=lst.get(i).getCompany_name() %></td>
                 <td><%=lst.get(i).getJob_position()%></td>
                
      
            </tr>
        
        <%} %>
        </tbody>
    </table>
    </fieldset>
    </div>
    <td ><input type="hidden" id="student_id" name="student_id" /></td>
        <td ><input type="hidden" id="job_id" name="job_id" /></td>
        <td ><input type="hidden" id="company_id" name="company_id" /></td>
        <td ><input type="hidden" id="job_position" name="job_position" /></td>
        <td ><input type="hidden" id="company_name" name="company_name" /></td>
    
    <table>
 

    </table>

    </form:form>
</body>
</html>