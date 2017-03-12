<%@page import="com.ict.trust.vbct.model.StudentJobSkillbo"%>
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
 <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
      <link href="<c:url value="/css/jquery.dataTables.min.css" />" rel="stylesheet">
 
     <script src="<c:url value="/js/jspdf.debug.js" />"></script>
    <script src="<c:url value="/js/jquery.dataTables.min.js" />"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function approve(id) {
	
	var jobid=id;
	document.getElementById("student_id").value=jobid;
	document.home.action = "job_approval.htm";
	document.home.submit();
}


function demoFromHTML() {
    var pdf = new jsPDF('p', 'pt', 'letter');
    // source can be HTML-formatted string, or a reference
    // to an actual DOM element from which the text will be scraped.
    source = $('#pdfdiv1')[0];

    // we support special element handlers. Register them with jQuery-style 
    // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
    // There is no support for any other type of selectors 
    // (class, of compound) at this time.
    specialElementHandlers = {
        // element with id of "bypass" - jQuery style selector
        '#bypassme': function (element, renderer) {
            // true = "handled elsewhere, bypass text extraction"
            return true
        }
    };
    margins = {
        top: 80,
        bottom: 60,
        left: 40,
        width: 522
    };
    	document.getElementById('pdfdiv1').style.display = "block";
    
    // all coords and widths are in jsPDF instance's declared units
    // 'inches' in this case
    pdf.fromHTML(
    source, // HTML string or DOM elem ref.
    margins.left, // x coord
    margins.top, { // y coord
        'width': margins.width, // max width of content on PDF
        'elementHandlers': specialElementHandlers
    },

    function (dispose) {
        // dispose: object with X, Y of the last line add to the PDF 
        //          this allow the insertion of new lines after html
        document.getElementById('pdfdiv1').style.display = "none";
        pdf.save('Test.pdf');
    }, margins);
}
$(document).ready(function() {
    $('#example').DataTable();
      
} );
</script>
</head>
<body>


<form:form >
<div id="pdfdiv">
<fieldset>
<h1 align="center">Job List</h1>
<table>
 <tr><td><img id="Img" height="42" width="42" src="<c:url value="/img/pdf.png" />" onclick="javascript:demoFromHTML()" /> Export to pdf</td></tr>
</table>
<table id="example" class="display" cellspacing="0" width="100%" border="1">

        <thead>
            <tr>
                
                <th>Student Id</th>
                <th>Student Skills </th>
                
                <th>Action</th>
               
            </tr>
        </thead>
        <tbody>
      <%List<StudentJobSkillbo> lst=(List<StudentJobSkillbo>)request.getAttribute("lst");
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr align="center">
               <td><%=lst.get(i).getStudent_id() %></td>
                <td><%=lst.get(i).getSkill_name()%></td>
      
                <td> <input type="button" value="Approve" onclick="approve('<%=lst.get(i).getStudent_id()%>')"/></td>
            </tr>
        
        <%} %>
        </tbody>
    </table>
    </fieldset>
    </div>
    
    
      <div id="pdfdiv1" style="display: none">
      <h1 align="center">Job List</h1>
<table id="example1" cellspacing="0" width="100%" >

        <thead>
            <tr>
                
                <th>Student Id</th>
                <th>Student Skill</th>
               
               
            </tr>
        </thead>
        <tbody>
        <%List<StudentJobSkillbo> lst1=(List<StudentJobSkillbo>)request.getAttribute("lst");
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr>
               <td><%=lst1.get(i).getStudent_id() %></td>
                <td><%=lst1.get(i).getSkill_name()%></td>
            </tr>
        
        <%} %>
        </tbody>
    </table>
    <input type="hidden" id="job_id" name="job_id" value="<%=session.getAttribute("job_id")%>">
        <input type="hidden" id="student_id" name="student_id">
    
    </div>
    </form:form>
</body>
</html>