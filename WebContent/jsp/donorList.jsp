<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Donor List</title>


<script type="text/javascript" src='<%=request.getContextPath()%>/js/jspdf.debug.js'></script>

<script type="text/javascript">
function downloadPdf(){
	document.home.action = "downloadPdf.htm";
	document.home.submit();
}
function demoFromHTML() {

	/* document.getElementById('example').style.display = "none"; */
	
	var pdf = new jsPDF('p', 'pt', 'letter');
	// source can be HTML-formatted string, or a reference
	// to an actual DOM element from which the text will be scraped.
	source = document.getElementById('pdfdiv112');
	// we support special element handlers. Register them with jQuery-style 
	// ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
	// There is no support for any other type of selectors 
	// (class, of compound) at this time.
	specialElementHandlers = {
		// element with id of "bypass" - jQuery style selector
		'#bypassme' : function(element, renderer) {
			// true = "handled elsewhere, bypass text extraction"
			return true;
		}
	};
	margins = {
		top : 20,
		bottom : 20,
		left : 75,
		width :1000
		
	};
	// all coords and widths are in jsPDF instance's declared units
	// 'inches' in this case
	
	document.getElementById('adminsgg').style.display = "block";
	
	pdf.fromHTML(source, // HTML string or DOM elem ref.
	margins.left, // x coord
	margins.top, { // y coord
		'width' : margins.width, // max width of content on PDF
		'elementHandlers' : specialElementHandlers
	},

	function(dispose) {
		// dispose: object with X, Y of the last line add to the PDF 
		//          this allow the insertion of new lines after html
		document.getElementById('adminsgg').style.display = "none";
		pdf.save('Donor List.pdf');
	}, margins);

	//     document.getElementById('heading').style.display = "none";
}
</script>

<style type="text/css">
input.button_css:hover
{

    text-decoration: underline;
    
}
.pg-selected
{
color:brown !important;
	font-size: 20px;
	text-decoration: underline;
	font-weight: bold;
	
}
</style>
<script type="text/javascript">  
function Pager(tableName, itemsPerPage) {
    this.tableName = tableName;  
    this.itemsPerPage = itemsPerPage;  
    this.currentPage = 1;  
    this.pages = 0;  
    this.inited = false;  
      
    this.showRecords = function(from, to) {          
        var rows = document.getElementById(tableName).rows;  
        // i starts from 1 to skip table header row  
        for (var i = 1; i < rows.length; i++) {  
            if (i < from || i > to)    
                rows[i].style.display = 'none';  
            else  
                rows[i].style.display = '';  
        }  
    }  
      
    this.showPage = function(pageNumber) {  
     if (! this.inited) {  
      alert("not inited");  
      return;  
     }  
  
        var oldPageAnchor = document.getElementById('pg'+this.currentPage);  
        oldPageAnchor.className = 'pg-normal';  
          
        this.currentPage = pageNumber;  
        var newPageAnchor = document.getElementById('pg'+this.currentPage);  
        newPageAnchor.className = 'pg-selected';  
          
        var from = (pageNumber - 1) * itemsPerPage + 1;  
        var to = from + itemsPerPage - 1;  
        this.showRecords(from, to);  
    }     
      
    this.prev = function() {  
        if (this.currentPage > 1)  
            this.showPage(this.currentPage - 1);  
    }  
      
    this.next = function() {  
        if (this.currentPage < this.pages) {  
            this.showPage(this.currentPage + 1);  
        }  
    }                          
      
    this.init = function() {  
        var rows = document.getElementById(tableName).rows;  
        var records = (rows.length - 1);   
        this.pages = Math.ceil(records / itemsPerPage);  
        this.inited = true;  
    }  
  
    this.showPageNav = function(pagerName, positionId) {  
     if (! this.inited) {  
      alert("not inited");  
      return;  
     }  
     var element = document.getElementById(positionId);  
       
     var pagerHtml = '<span onclick="' + pagerName + '.prev();" style="cursor: pointer;background-color: #FFF;color: #000;font-size: 17px;" class="pg-normal"> « Previous </span> &nbsp; ';  
        for (var page = 1; page <= this.pages; page++)   
            pagerHtml += '<span id="pg' + page + '" style="cursor: pointer;color: #000;"  onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span>&nbsp;  ';  
        pagerHtml += '&nbsp;<span onclick="'+pagerName+'.next();" style="cursor: pointer;background-color: #FFF;color: #000;font-size: 17px;" > Next »</span>';              
          
        element.innerHTML = pagerHtml;  
    }; 
}  
</script> 



</head>
<body onload="selectMenu('donor');">

<form:form name="donorList" method="POST" >

<% DateFormat dateandtime = new SimpleDateFormat("dd/MM/yyyy");
	String curr_year = dateandtime.format(new Date()).split("/")[2];
	String selected = (String) request.getAttribute("select");
%>
	<h1 align="center">Foreign Donor List For Year - <%= selected %></h1>
	<div style="float: left;">
	<b>Select Year :</b> <select name="date" onchange="getList(this.value);">
	<option <%if(selected.equalsIgnoreCase(curr_year)){ %>selected="selected"<%} %> value="<%= curr_year %>"> <%= curr_year %></option>
	<option <%if(Integer.parseInt(selected)== (Integer.parseInt(curr_year) - 1) ){ %>selected="selected"<%} %> value="<%= Integer.parseInt(curr_year) - 1 %>" > <%= Integer.parseInt(curr_year) - 1 %></option>
	<option <%if(Integer.parseInt(selected)== (Integer.parseInt(curr_year) - 2) ){ %>selected="selected"<%} %> value="<%= Integer.parseInt(curr_year) - 2%>" > <%= Integer.parseInt(curr_year) - 2%></option>
</select>
</div>
	<div style="vertical-align: middle;" align="right"><a style="vertical-align: middle;" href="#" onclick="downloadPdf();">
	<img alt="Export to PDF" title="Export to PDF" src="<%=request.getContextPath()%>/img/pdf.png" style="width: 30px;"></a></div>
	<br/>	
	<table width="100%" border="0" id="don" class="vbcttbl">
		<tr style="">
			<th>Name </th>
			<th>Country</th>
			<th>Donation Purpose</th>
			<th>Amount (<label class="rupees"><img src="<%=request.getContextPath()%>/img/rupee.png" style="width: 12px;"/></label>)</th>
		</tr>
	
	<c:forEach var="donorlist" items="${requestScope.donorlst}">
		<tr>
			<td>${donorlist.donor_name}</td>
			<td>${donorlist.country}</td>
			<td>${donorlist.donation_purpose}</td>
			<td>${donorlist.donation_amount}</td>
		</tr>
	</c:forEach>
	</table>
	<br/>
	<div id="pageNavPosition" align="center" style="background-color: white;color: white;padding-bottom: 5px"></div> 
		<script type="text/javascript">
        var pager = new Pager('don',10);   
        pager.init();   
        pager.showPageNav('pager', 'pageNavPosition');   
        pager.showPage(1);
    </script> 
	
	
	
	<div id="pdfdiv112">
	<div id="adminsgg"  style="font-size: 12px;display: none">
	
		<div style="width: 100%;margin-left:2000px;background-color: gray;font-family:calibri, arial black;font-size: 18; font-weight: bold;" align="center">
			Vraj Bhagirathi Charitable Trust - Donor's List
		</div>
		
		<table width="100%" border="0" id="don" class="vbcttbl">
		<tr style="">
			<th>Name</th>
			<th>Country</th>
			<th>Donation Purpose</th>
			<th>Amount</th>
		</tr>
	
		<c:forEach var="donorlist" items="${requestScope.donorlst}">
		<tr>
			<td>${donorlist.donor_name}</td>
			<td>${donorlist.country}</td>
			<td>${donorlist.donation_purpose}</td>
			<td>${donorlist.donation_amount}</td>
		</tr>
		</c:forEach>
		</table>
		
	</div>
	</div>
	
	</form:form>
</body>
</html>