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

function fun(id) {
var stu_id=id;
document.getElementById('student_id').value=stu_id;
document.home.action = "insert_student_status.htm";
	document.home.submit();

}
</script>
</head>
<body>


<form:form >
<div id="pdfdiv">
<fieldset>
<h1 align="center">Student List</h1>
<table id="example" class="display" cellspacing="0" width="100%" border="1" align="center">

        <thead>
            <tr>
                
                <th align="center">Sr No</th>
                <th>Student ID</th>
                <th>First Name</th>
                <th>Last Name</th>
               
            </tr>
        </thead>
        <tbody>
      <%List<StudentInfoBo> lst=(List<StudentInfoBo>)request.getAttribute("lst");
     int index=1;
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr align="center">
           <td><%=index++ %></td>
                <td ><a href="#" onclick="javascript:fun('<%=lst.get(i).getStudent_id()%>')" style="color: #CC0000" ><%=lst.get(i).getStudent_id() %></a></td>
                <td><%=lst.get(i).getFname()%></td>
                <td><%=lst.get(i).getLname() %></td>
      
            </tr>
        
        <%} %>
        </tbody>
    </table>
    </fieldset>
    </div>
    <td ><input type="hidden" id="student_id" name="student_id" /></td>
    <table>
 <tr><td>   <button onclick="javascript:demoFromHTML();">PDF</button></td></tr>
 <tr><td><img id="Img" src="/img/pdf.png" onclick="javascript:demoFromHTML()" /></td></tr>
 

    </table>

    </form:form>
</body>
</html>