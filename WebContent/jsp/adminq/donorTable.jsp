<%@page import="com.ict.trust.vbct.model.DonationBO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>
<body>
<h1 align="center">Donor List</h1>
	<table width="100%" border="0" id="don" class="vbcttbl">
		<tr style="">
			<th>Name</th>
			<th>Country</th>
			<th>Donation Purpose</th>
			<th>Amount</th>
			<th>Action</th>
		</tr>
	
	<c:forEach var="donorlist" items="${requestScope.donorlst1}">
		<tr>
			<td>${donorlist.donor_name}</td>
			<td>${donorlist.country}</td>
			<td>${donorlist.donation_purpose}</td>
			<td>${donorlist.donation_amount}</td>
			<td align="center">
			<c:choose>
			    <c:when test="${donorlist.status == 'deleted'}">
			       <span align="center" style="color: red;"> Deleted </span>
			    </c:when>
			    <c:otherwise>
			       <input style="width: 60px;" type="button" value="Delete" onclick="del('${donorlist.donor_id}')"/>
			    </c:otherwise>
			</c:choose>
			
			</td>
		</tr>
	</c:forEach>
	</table>
	
</body>
</html>