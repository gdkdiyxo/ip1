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
function getjobfromcompany(id) {

	var jobid=id;
	document.getElementById("company_id").value=jobid;
	document.home.action = "getjobfromcompany.htm";
	document.home.submit();
}
 $(document).ready(function() {
    $('#example').DataTable();
      
} );

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
            return true;
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
        pdf.save('Company_list.pdf');
    }, margins);
}
</script>
</head>
<body>


<form:form >
<div id="pdfdiv">
<fieldset>
<h1 align="center">Company List</h1>
  <table>
 <tr><td><img id="Img" height="42" width="42" src="<c:url value="/img/pdf.png" />" onclick="javascript:demoFromHTML()" /> Export to pdf</td></tr>
</table>
<table id="example" class="display" cellspacing="0" width="100%" border="1">

        <thead>
            <tr>
                
                <th>Comapny Name</th>
                <th>Contact Person</th>
                <th>Email Id</th>
                <th>City</th>
               
            </tr>
        </thead>
        <tbody>
      <%List<CompanyBo> lst=(List<CompanyBo>)request.getAttribute("lst");
     
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr>
                <td ><a href="#" onclick="javascript:getjobfromcompany('<%=lst.get(i).getCompany_id()%>')" style="color: #CC0000" ><%=lst.get(i).getCompany_name() %></a></td>
                 <td><%=lst.get(i).getContact_person_lname() %></td>
                <td><%=lst.get(i).getEmail() %></td>
                  <td><%=lst.get(i).getCity()%></td>
      
            </tr>
        
        <%} %>
        </tbody>
    </table>
    </fieldset>
    </div>
    
   
      <div id="pdfdiv1" style="display: none">
      <h1 align="center">Company List</h1>
    
<table id="example1" cellspacing="0" width="100%" >

        <thead>
            <tr>
                
                <th>Comapny Name</th>
                <th>Contact Person</th>
                <th>Email Id</th>
                <th>City</th>
               
            </tr>
        </thead>
        <tbody>
        <%List<CompanyBo> lst1=(List<CompanyBo>)request.getAttribute("lst");
for(int i=0;i < lst.size();i++)
{ %>
        
        <tr>
               <td><%=lst.get(i).getCompany_name()%></td>
                 <td><%=lst.get(i).getContact_person_lname() %></td>
                <td><%=lst.get(i).getEmail() %></td>
                  <td><%=lst.get(i).getCity()%></td>
      
            </tr>
        
        <%} %>
        </tbody>
    </table>
    <input type="hidden" id="company_id" name="company_id">
    </div>
    </form:form>
</body>
</html>