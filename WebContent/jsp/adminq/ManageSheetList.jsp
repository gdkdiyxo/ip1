<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Balance Sheet List</title>
<script type="text/javascript">
function getSheetFromTableadmin(val){
	if(val == null || val == ""){
		alert("Sorry for inconvenience. Some error occured.");
	}else{
		document.adminform.action = "getSheetFromTable.htm?sheetID="+val;
		document.adminform.submit();
	}
}
function deleteSheet(val)
{
	if(confirm("This record will be deleted permanently. Do you want to delete ???"))
	{ 
			document.adminform.action = "deleteSheet.htm?delsheetID="+val;
			document.adminform.submit();
	}
}
function hideSheet(val)
{
	if(confirm("Are your sure you want to hide this balance sheet from homepage balance sheet list??"))
	{ 
			document.adminform.action = "hideSheet.htm?hidesheetID="+val;
			document.adminform.submit();
	}
}
function showSheet(val)
{
	if(confirm("Are your sure you want to show this balance sheet from homepage balance sheet list??"))
	{ 
			document.adminform.action = "showSheet.htm?showsheetID="+val;
			document.adminform.submit();
	}
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
<body onload="changeclass();">
<form:form name="ManageSheet">
	<h1 align="center">Manage Balance Sheet List</h1>
	
	<br>
	<table width="100%" border="0" id="ManageSheet" class="vbcttbl" align="center">
		<tr style="">
			<th width="5%">Sr. No.</th>
			<th width="35%">Title</th>
			<th width="10%">Year</th>
			<th width="20%">Download Sheet</th>
			<th width="15%">Visibility at Home</th>
			<th width="15%">Delete</th>
		</tr>
	
	<c:set var="count" value="1"></c:set>
	<c:forEach var="sheetlist" items="${requestScope.sheetlst}">
		 <c:if test="${sheetlist.status != 'Deleted'}">
		<tr>
			<td align="center">${count}</td>
			<td>${sheetlist.sheet_title}</td>
			<td align="center">${sheetlist.sheet_year}</td>
			<td align="center"><a onclick="getSheetFromTableadmin(this.name);" href="#" name="${sheetlist.sheet_id}" style="color: blue;">Download</a></td>
	      	
	      	<c:if test="${sheetlist.status == 'H'}">
	      		<td align="center">
	      		<span class="tooltip" onmouseover="tooltip.pop(this, 'This button shows balance<br> sheet on homepage')">
	      		<input type="button" style="width: 70px;" class="smBtnRed" name="${sheetlist.sheet_id}" value="Show" onclick="showSheet(this.name);"/>
	      		</span>
	      		</td>
	      	</c:if>
	      	<c:if test="${sheetlist.status == 'N'}">
	      	<td align="center">
	      	<span class="tooltip" onmouseover="tooltip.pop(this, 'This button hides balance<br> sheet from homepage')">
	      	<input type="button" style="width: 70px;" class="smBtnWhite" name="${sheetlist.sheet_id}" value="Hide" onclick="hideSheet(this.name);"/>
	      	</span>
	      	</td>
	      	</c:if>
	      	<td align="center">
	      	<a title="Delete" style="cursor: pointer;" name="${sheetlist.sheet_id}" onclick="deleteSheet(this.name);">
	      	<img src="<%= request.getContextPath() %>/images/error.png"/>
	      	</a>
	      	</td>
		</tr>
		<c:set var="count" value="${count+1}"></c:set>
		 </c:if>
	</c:forEach>
	</table>
	<br>
	<div id="pageNavPosition" align="center" style="background-color: white;color: white;padding-bottom: 5px"></div> 
		<script type="text/javascript">
        var pager = new Pager('ManageSheet',10);   
        pager.init();   
        pager.showPageNav('pager', 'pageNavPosition');   
        pager.showPage(1);
    </script>
	</form:form>
</body>
</html>