<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page import="com.ict.trust.vbct.model.Employee"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Of Employee</title>
</head>
<body>
<form:form>
<%
		HashMap<String, Object> hashMap = (HashMap<String, Object>) request
				.getAttribute("haseMap");
		if (hashMap != null) {
			
		List<Employee>	employees=(List<Employee>)hashMap.get("employees");
		if (employees.size()>0) {
			Employee employee=employees.get(0);
			
			String img0 = javax.xml.bind.DatatypeConverter
					.printBase64Binary(employee.getContentBytes());
	%>
	<img id="studphoto" src="data:image/jpg;base64,<%=img0%>"
			alt="Photo"
			style="height: 117px; margin-top: 4px; width: 117px;" />
	
	<%}} %>
</form:form>


</body>
</html>