<%@page import="com.ict.trust.vbct.model.Login"%>
<%@page import="java.util.HashMap"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/img/sm.jpg" type="image/x-icon">
<html manifest="vbct-cache-welcome.appcache">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Internship Management System</title>
<%@include file="head.jsp" %>
<body>
<form:form name="home">
<%@ include file="header.jsp" %>
		<div class="maindiv">
			<table class="position" style="height: 500px" border="0">
				<tr>
					<td
						style="width: 190px; vertical-align: top; border-right: 1px solid lightgray;">
						<%@include file="leftmenu.jsp"%>
					</td>
					<td style="vertical-align: top; padding: 2px 5px 5px 10px;">
						<div class="maindiv">
							<!-- content div -->
							<%
								String filename = request.getAttribute("filename") + ".jsp";
							%>
							<jsp:include page="<%=filename%>" />
						</div> <%if (request.getAttribute("wrong") != null) {
								 			String error = (String) request.getAttribute("wrong");
								 %>
						<div id="mydiv" name="mydiv" >
							<b style="margin-left: 270px;"> <img
								src="<%=request.getContextPath()%>/images/error.png" /> <%=error%>
							</b>
						</div> <%
								 	}
								 %>
					</td>
				</tr></table>
		</div>
		<%@include file="footer.jsp" %>
</form:form>
</body>
</html>