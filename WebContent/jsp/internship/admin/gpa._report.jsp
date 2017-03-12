<%@page import="com.ict.trust.vbct.model.ReportlistBo"%>
<%@page import="com.ict.trust.vbct.model.StudentGpaBo"%>
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
function searchgpa()
{
document.home.action = "searchgpa.htm";
document.home.submit();
}
</script>
<script type="text/javascript">
  $(document).ready(function() {
    $('#gpa_table').DataTable();
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
        pdf.save('Test.pdf');
    }, margins);
}
</script>

</head>
<body>
<form:form modelAttribute="Searchgpa">
<h1 align="center">Search GPA</h1>
<br>
<div class="formdesign">
<div><h4 align="center" style="margin: 5px 2px;color: #961200;">Search Student</h4>
</div>
<table align="center">
<tr>
	<td> country: </td>
	<td>
	<select  id="country" name="country">
	<option label="--ALL--" value="" selected="selected">Select</option>
	<% List<ReportlistBo> lst2=(List<ReportlistBo>)request.getAttribute("country");
	for(int i=0;i<lst2.size();i++)
	{
	 %>
	<option value="<%=lst2.get(i).getCountry()%>"><%=lst2.get(i).getCountry() %></option>
	<%} %>
	</select>

	<span style="display: none;color: red;font-size: 12px;" id="country1">You can't leave this empty</span>
	</td>
	<td> Year: </td>
	<td>
	<td>
	<select  id="year" name="year">
	<option label="--ALL--" value="" selected="selected">Select</option>
	<% List<ReportlistBo> lst_year=(List<ReportlistBo>)request.getAttribute("year");
	for(int i=0;i<lst_year.size();i++)
	{
	 %>
	<option value="<%=lst_year.get(i).getYear()%>"><%=lst_year.get(i).getYear() %></option>
	<%} %>
	</select>

	<span style="display: none;color: red;font-size: 12px;" id="internship_id1">You can't leave this empty</span>
	</td> 
	</tr>
	
<tr>
	<td> University: </td>
	<td>
	<select  id="university" name="university">
	<option label="--ALL--" value="" selected="selected">Select</option>
	<% List<ReportlistBo> lst_uni=(List<ReportlistBo>)request.getAttribute("university");
	for(int i=0;i<lst_uni.size();i++)
	{
	 %>
	<option value="<%=lst_uni.get(i).getUniversity()%>"><%=lst_uni.get(i).getUniversity() %></option>
	<%} %>
	</select>

	<span style="display: none;color: red;font-size: 12px;" id="country1">You can't leave this empty</span>
	</td>
	<td> University Locatiion: </td>
	<td>
	<td>
	<select  id="university_location" name="university_location">
	<option label="--ALL--" value="" selected="selected">Select</option>
	<% List<ReportlistBo> lst_uni_loc=(List<ReportlistBo>)request.getAttribute("university_location");
	for(int i=0;i<lst_uni_loc.size();i++)
	{
	System.out.println(lst_uni_loc.get(i).getUniversity_location());
	 %>
	<option value="<%=lst_uni_loc.get(i).getUniversity_location()%>"><%=lst_uni_loc.get(i).getUniversity_location() %></option>
	<%} %>
	</select>

	<span style="display: none;color: red;font-size: 12px;" id="internship_id1">You can't leave this empty</span>
	</td> 
	</tr>
	<tr>
	<td> Degree Type :  <font size="2" style="color: red;">*</font></td>
	<td> 
	<select  id=degree_type name="degree_type">
	<option label="--Select--" value="" selected="selected">--ALL--</option>
	<option  value="Graduate">Graduate</option>
	<option value="Undergraduate" >Undergraduate</option>
	
	
	</select>	<span style="display: none;color: red;font-size: 12px;" id="degree_type1">You can't leave this empty</span>
	</td>
	</tr>
</table>
</div>

<table align="center">
<tr align="center">
	<td style="padding-top: 12px;">
	<input type="button" value="Submit" style="cursor: pointer;" id="buttone" onclick="searchgpa();"/>
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
<table id="gpa_table" class="display" cellspacing="0" width="100%" border="1">

        <thead>
            <tr>
                
                <th>First Name</th>
                <th>Last Name</th>
                <th>Country</th>
                <th>GPA</th>
                 <th>Degree</th>
                
               
            </tr>
        </thead>
        <tbody>
      <%List<StudentGpaBo> lst=(List<StudentGpaBo>)request.getAttribute("lst");
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr>
               <td><%=lst.get(i).getFname()%></td>
                <td><%=lst.get(i).getLname()%></td>
                <td><%=lst.get(i).getCountry()%></td>
                <td><%=lst.get(i).getDegree_gpa()%></td>
                       <td><%=lst.get(i).getDegree_type()%></td>
      
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
                
                 <th>First Name</th>
                <th>Last Name</th>
                <th>Country</th>
                <th>GPA</th>
               <th>Degree</th>
                
               
            </tr>
        </thead>
        <tbody>
      <%List<StudentGpaBo> lst1=(List<StudentGpaBo>)request.getAttribute("lst");
for(int i=0;i < lst.size();i++)
{ %>
        
            <tr>
               <td><%=lst.get(i).getFname()%></td>
                <td><%=lst.get(i).getLname()%></td>
                <td><%=lst.get(i).getCountry()%></td>
                <td><%=lst.get(i).getDegree_gpa()%></td>
                 <td><%=lst.get(i).getDegree_type()%></td>
      
            </tr>
        
        <%} %>
        </tbody>
    </table>
    </div>
</form:form>
</body>
</html>