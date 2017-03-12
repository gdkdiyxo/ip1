<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Internship Management System | Login</title>

<style type="text/css">
.loginbxbx{
	padding:2px 25px ;
	border-radius: 25px;
	height: 200px;
	border: 3px solid rgb(211, 151, 143);
	background: rgb(251, 195, 149) none repeat scroll 0% 0%;
}
</style>

</head>
<body>
<%session.invalidate(); %>
<h1 align="center">Login</h1>
	<div>
		<table width="100%" border="0">
			
			<tr>
				<td width="20%">&nbsp;</td>
				<td width="60%">
					<form:form modelAttribute="login" name="loglogSS" method="POST" action="checkLoginRepr();">
					<table border="0" width="100%" class="loginbxbx">
						<tr>
						 	<td align="right">Username : <font size="2" style="color: red;">*</font></td>
							<td align="center">
							<input onclick="hiddee();" type="text" id="username" name="login"  onchange="Hide(this);" onclick="Hide(this);"/>
							<span style="display: none;color: red" id="username1">You can't leave this empty</span>
							</td>
						</tr>
						<tr>
							<td align="right">Password : <font size="2" style="color: red;">*</font></td>
							<td align="center">
							<input onclick="hiddee();" type="password" id="password" name="xtxtKllFbbd3ES" onchange="Hide(this);" onclick="Hide(this);"/>
							<span style="display: none;color: red" id="password1">You can't leave this empty</span>
							</td>
						</tr>
						<tr>
							<td align="right"></td>
							<td align="right"></td>
						</tr>
						
						<tr>
							<td align="center" colspan="2"><input type="submit" value="Submit" onclick="javascript:checkLoginRepr();">
							<input type="reset" value="Reset"/> 
							<span style="display: none;color: red" id="password1">You can't leave this empty</span></td>
						</tr>
						<tr>
						<%if((request.getAttribute("Invalid")) != null) { %>
						<td colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	Invalid Username or Password
						</td>
						<%} %>
						</tr>
					</table>
					</form:form>
				</td>
				<td width="20%">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" style="height: 55px;">&nbsp;</td>
			</tr>
		</table>
	</div>
</body>
</html>