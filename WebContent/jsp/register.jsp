<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
</head>
<body>
	<form:form method="post" action="saveReg.htm"
		enctype="multipart/form-data" >

		<table>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="first_name"></td>

			</tr>
			<tr>
				<td>Middle Name</td>
				<td><input type="text" name="middle_name"></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="last_name"></td>
			</tr>
			<tr>
				<td>Login Name</td>
				<td><input type="text" name="login_name"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
		<tr>
				<td>File Upload</td>
				<td><input type="file" name="file"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="Submit"
					value="Submit"> <input type="button" onclick="onCancel();"
					value="Cancel"></td>
			</tr>
		</table>




	</form:form>
	<%
		HashMap<String, Object> hashMap = (HashMap<String, Object>) request
				.getAttribute("haseMap");
		if (hashMap != null) {
			String success = (String) hashMap.get("successful");
			if (success != null) {
	%>
	<font color="GREEN"><%=success%></font>
	<%
		}
		}
	%>

</body>
</html>