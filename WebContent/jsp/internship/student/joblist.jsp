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
 
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function intrest(id) {
	alert(id);
	var jobid=id;
	document.getElementById("job_id").value=jobid;
	document.home.action = "jobInterest.htm";
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
<table id="example" class="display" cellspacing="0" width="100%">

        <thead>
            <tr>
                
                <th>Position</th>
                <th>responsibilities</th>
                <th>requirements</th>
                <th>Action</th>
               
            </tr>
        </thead>
        <tbody>
      <%List<JobBo> lst=(List<JobBo>)request.getAttribute("lst");
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr>
               <td><%=lst.get(i).getJob_position() %></td>
                <td><%=lst.get(i).getResponsibilities()%></td>
                <td><%=lst.get(i).getRequirements() %></td>
      
                <td> <input type="button" value="Interested" onclick="intrest('<%=lst.get(i).getJob_id()%>')"/></td>
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
                
                <th>Position</th>
                <th>responsibilities</th>
                <th>requirements</th>
               
            </tr>
        </thead>
        <tbody>
        <%List<JobBo> lst1=(List<JobBo>)request.getAttribute("lst");
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr>
               <td><%=lst1.get(i).getJob_position() %></td>
                <td><%=lst1.get(i).getResponsibilities()%></td>
                <td><%=lst1.get(i).getRequirements() %></td>
            </tr>
        
        <%} %>
        </tbody>
    </table>
    <input type="hidden" id="job_id" name="job_id">
    </div>
    </form:form>
</body>
</html>