<%@page import="com.ict.trust.vbct.model.StudentInfoBo"%>
<%@page import="com.ict.trust.vbct.model.InternshipTypeBo"%>
<%@page import="com.ict.trust.vbct.model.CompanyBo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
      <link href="<c:url value="/css/jquery.dataTables.min.css" />" rel="stylesheet">
 
     <script src="<c:url value="/js/jspdf.debug.js" />"></script>
    <script src="<c:url value="/js/jquery.dataTables.min.js" />"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function searchintern()
{
document.home.action = "searchinterntype.htm";
document.home.submit();
}
</script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#employers_table').DataTable();
} );

</script>
<script type="text/javascript">




function employers_pdf() {
    var pdf = new jsPDF('p', 'pt', 'letter');
    // source can be HTML-formatted string, or a reference
    // to an actual DOM element from which the text will be scraped.
    source = $('#employers1')[0];

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
    	document.getElementById('employers1').style.display = "block";
    
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
        document.getElementById('employers1').style.display = "none";
        pdf.save('Student.pdf');
    }, margins);
}
</script>

</head>
<body>
<form:form modelAttribute="SearchInternType">
<h1 align="center">Search Internship Type</h1>
<br>
<div class="formdesign">
<div><h4 align="center" style="margin: 5px 2px;color: #961200;">Search Student</h4>
</div>
<table align="center">
<tr>
		</td>
	<td> Internship type:  <font size="2" style="color: red;">*</font></td>
	<td>
	<select  id="internship_type" name="internship_type">
	<option label="--Select--" value="" selected="selected">Select</option>
	<% List<InternshipTypeBo> lst2=(List<InternshipTypeBo>)request.getAttribute("i");
	for(int i=0;i<lst2.size();i++)
	{
	 %>
	<option value="<%=lst2.get(i).getId()%>"><%=lst2.get(i).getInternship_name() %></option>
	<%} %>
	</select>
	
	
</tr>
	

</table>
</div>

<table align="center">
<tr align="center">
	<td style="padding-top: 12px;">
	<input type="button" value="Submit" style="cursor: pointer;" id="buttone" onclick="searchintern();"/>
	</td>
	<td  style="padding-top: 12px;">
	<input type="reset" value="Reset" style="cursor: pointer;"/>
	</td>
</tr>

</table>
<div id="employers">
<fieldset>
<h1 align="center">Student List</h1>
<table>
 <tr><td><img id="Img" height="42" width="42" src="<c:url value="/img/pdf.png" />" onclick="javascript:employers_pdf()" /> Export to pdf</td></tr>
</table>
<table id="employers_table" class="display" cellspacing="0" width="100%" border="1">

        <thead>
            <tr>
                
               <th>Last Name</th>
                <th>First Name</th>
                <th>Year</th>
                <th>Semester</th>
            </tr>
        </thead>
        <tbody>
      <%List<StudentInfoBo> lst=(List<StudentInfoBo>)request.getAttribute("list_internshiiipStu");
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr>
             <td><%=lst.get(i).getLname() %></td>
                <td><%=lst.get(i).getFname()%></td>
                <td><%=lst.get(i).getYear()%></td>
                <td><%=lst.get(i).getSemester()%></td>
      
            </tr>
        
        <%} %>
        </tbody>
    </table>
    </fieldset>
    </div>
    
    
      <div id="employers1" style="display: none">
      <h1 align="center">Student List</h1>
<table id="employers_table1" class="display" cellspacing="0" width="100%">

         <thead>
            <tr>
                
                   <th>Last Name</th>
                <th>First Name</th>
                <th>Year</th>
                <th>Semester</th>
            </tr>
        </thead>
        <tbody>
      <%List<StudentInfoBo> lst1=(List<StudentInfoBo>)request.getAttribute("list_internshiiipStu");
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr>
                <td><%=lst.get(i).getLname() %></td>
                <td><%=lst.get(i).getFname()%></td>
                <td><%=lst.get(i).getYear()%></td>
                <td><%=lst.get(i).getSemester()%></td>
      
            </tr>
        
        <%} %>
        </tbody>
    </table>
    </div>
</form:form>
</body>
</html>