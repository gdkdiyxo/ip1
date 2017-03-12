<%@page import="com.ict.trust.vbct.model.ReportlistBo"%>
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
function searchemployers()
{
document.home.action = "searchemployers.htm";
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
        pdf.save('Company_list.pdf');
    }, margins);
}
</script>

</head>
<body>
<form:form modelAttribute="Searchemployers">
<h1 align="center">Search Employers</h1>
<br>
<div class="formdesign">
<div><h4 align="center" style="margin: 5px 2px;color: #961200;">Search Student</h4>
</div>
<table align="center">
<tr>
	<td> City:  <font size="2" style="color: red;">*</font></td>
	<td>
	<select  id="city" name="city">
	<option label="--ALL--" value="" selected="selected">Select</option>
	<% List<ReportlistBo> lst2=(List<ReportlistBo>)request.getAttribute("city_list");
	for(int i=0;i<lst2.size();i++)
	{
	 %>
	<option value="<%=lst2.get(i).getCity()%>"><%=lst2.get(i).getCity() %></option>
	<%} %>
	</select>

	<span style="display: none;color: red;font-size: 12px;" id="country1">You can't leave this empty</span>
	</td>
	
</tr>
	

</table>
</div>

<table align="center">
<tr align="center">
	<td style="padding-top: 12px;">
	<input type="button" value="Submit" style="cursor: pointer;" id="buttone" onclick="searchemployers();"/>
	</td>
	<td  style="padding-top: 12px;">
	<input type="reset" value="Reset" style="cursor: pointer;"/>
	</td>
</tr>

</table>
<div id="employers">
<fieldset>
<h1 align="center">Company List</h1>
<table>
 <tr><td><img id="Img" height="42" width="42" src="<c:url value="/img/pdf.png" />" onclick="javascript:employers_pdf()" /> Export to pdf</td></tr>
</table>
<table id="employers_table" class="display" cellspacing="0" width="100%" border="1">

        <thead>
            <tr>
                
                <th>Company Name</th>
                <th>City</th>
                <th>Telephone</th>
                <th>Email</th>
               
            </tr>
        </thead>
        <tbody>
      <%List<CompanyBo> lst=(List<CompanyBo>)request.getAttribute("employers_lst");
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr>
               <td><%=lst.get(i).getCompany_name() %></td>
                <td><%=lst.get(i).getCity()%></td>
                <td><%=lst.get(i).getTelephone()%></td>
                <td><%=lst.get(i).getEmail()%></td>
      
            </tr>
        
        <%} %>
        </tbody>
    </table>
    </fieldset>
    </div>
    
    
      <div id="employers1" style="display: none">
      <h1 align="center">Company List</h1>
<table id="employers_table1" class="display" cellspacing="0" width="100%">

         <thead>
            <tr>
                
                <th>Company Name</th>
                <th>City</th>
                <th>Telephone</th>
                <th>Email</th>
               
            </tr>
        </thead>
        <tbody>
      <%List<CompanyBo> lst1=(List<CompanyBo>)request.getAttribute("employers_lst");
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr>
               <td><%=lst1.get(i).getCompany_name() %></td>
                <td><%=lst1.get(i).getCity()%></td>
                <td><%=lst1.get(i).getTelephone()%></td>
                <td><%=lst1.get(i).getEmail()%></td>
      
            </tr>
        
        <%} %>
        </tbody>
    </table>
    </div>
</form:form>
</body>
</html>