<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		document.home.action = "getSheetFromTable.htm?sheetID="+val;
		document.home.submit();
	}
}
</script>
</head>
<body onload="selectMenu('balance');">
	<h1 align="center">Balance Sheet List</h1>
	<table width="70%" border="0" id="" class="vbcttbl" align="center">
		<tr style="">
			<th width="10%">Sr. No.</th>
			<th width="45%">Title</th>
			<th width="16%">Year</th>
			<th width="24%">Download Sheet</th>
		</tr>
	
	<c:set var="count" value="1"></c:set>
	<c:forEach var="sheetlist" items="${requestScope.sheetlst}">
		<tr>
		<td align="center">${count}</td>
		<td>${sheetlist.sheet_title}</td>
		<td align="center">${sheetlist.sheet_year}</td>
		<td align="center"><a onclick="getSheetFromTableadmin(this.name);" href="#" name="${sheetlist.sheet_id}" style="color: blue;">Download</a></td>
		</tr>
		<c:set var="count" value="${count+1}"></c:set>
	</c:forEach>
	</table>
	<%
		if(request.getAttribute("sheetdata") != null)
		{
			System.out.println("IN iframe");
	%>
	<iframe id="data" name="data" style="display: none;" align="middle" src="<%=request.getAttribute("sheetdata").toString()%>">
	
	</iframe>
	<%} %>
</body>
</html>