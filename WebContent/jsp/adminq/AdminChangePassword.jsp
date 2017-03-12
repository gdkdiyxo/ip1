<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<style>
#mcTooltipWrapper{
padding: 9px;
opacity: 0;
display: none;
visibility: hidden;
top: 240.333px !important;
left: 949px !important;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>

<script type="text/javascript">
	function checkinfoadmin() {
		var flag = true;
		if (document.getElementById("oldPass").value == "") {
			document.getElementById('div_old').style.display = "block";
			flag = false;
		}
		if (document.getElementById("newPass").value == "") {
			document.getElementById('div_new_admin').style.display = "block";
			flag = false;
		}
		if (flag == false) {
			return false;
		} else {
			changePasswordadmin();
		}
	}
	function hide_old() {
		document.getElementById("invalPass").style.display = "none";
	}
	function hide_retype() {
		document.getElementById("checkpasstd").style.display = "none";
	}
	function hide_newadmin() {
		document.getElementById("div_new_admin").style.display = "none";
	}
	function hide_divold() {
		document.getElementById("div_old").style.display = "none";
	}
	function hidestr() {
		if (document.getElementById("div_strgth").style.display = "block") {
			document.getElementById("div_strgth").style.display = "none";
		}
	}
	function changePasswordadmin() {
		var oldPass = document.getElementById("oldPass").value;
		var newPass = document.getElementById("newPass").value;
		var checkPass = document.getElementById("checkPass").value;
		if (newPass == checkPass) {
			var xmlhttp;
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					var xml = xmlhttp.responseText;
					if (xml == "wrongPass") {
						document.getElementById("invalPass").style.display = "block";
					}
					if (xml == "success") {
						document.getElementById("success").style.display = "block";
						document.getElementById("oldPass").value = "";
						document.getElementById("newPass").value = "";
						document.getElementById("checkPass").value = "";
					}
					if (xml == "problem") {
						document.getElementById("problem").style.display = "block";
					}}}
			var url = "changePass.htm?oldPass="+oldPass+"&newPass="+newPass;
			xmlhttp.open("POST", url, true);
			xmlhttp.send();
		} else {
			document.getElementById("checkpasstd").style.display = "block"
		}
	}
	function CheckPasswordStrengthadmin(input) {
		var decimal = /^(?=.*\d)(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
		
		if (input.value.match(decimal)) {
			return true;
		} else {
			document.getElementById("newPass").value = "";
			document.getElementById("div_strgth").style.display = "block";
			return false;
		}
	}
</script>

</head>
<body>
<form:form modelAttribute="">
<h1 align="center">Change Password</h1>
<input type="hidden" name="sheet_data" id="sheet_data" />
<br>
<div class="formdesign">
<div><span id="notice" style="font-size: 12px; color: red; display: block; align:right;margin-top: 2px;margin-left: 5px">* Mandatory fields</span></div>
<table align="center" border="0">
				<tr>
					<td id="problem" style="display: none; color: blue;">Something
						went wrong. Please try after sometime. Thank You</td>
				</tr>
				
				<tr>
					<td>Type your old Password<font size="2" style="color:red" >*</font></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input name="oldPass" type="password" id="oldPass" onblur="hide_old(); hide_divold();"	onclick="hide_old(); hide_divold();" onchange="hide_old(); hide_divold();"> 
							<span id="div_old"	style="color: red; display: none;font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;You Cant leave this empty</span>
						
					</td>
				</tr>
				<tr><td colspan="2" style="padding-top: 7px;"></td></tr>
				<tr>
					<td>Type new Password<font size="2" style="color:red">*</font></td>
					<td>&nbsp;&nbsp;&nbsp; <span class="tooltip"
						onmouseover="tooltip.pop(this, 'Password length must<br> be between 8 to 15 characters<br> with  at least one alphabet<br> letter,one numeric digit and<br> one special character')">
							<input name="newPass" type="password" id="newPass" onchange="CheckPasswordStrengthadmin(this); hide_newadmin();" onclick="hide_newadmin(); hidestr();" onblur="hide_newadmin();">
							</span>
							 <span id="div_new_admin" style="color: red; display: none;;font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;You Cant leave this empty</span>
							<div id="div_strgth" style="color: red; display: none;;font-size: 12px;"	align="center">&nbsp;&nbsp;&nbsp;&nbsp;Please enter a valid new password</div>
					</td>
				</tr>
				<tr><td colspan="2" style="padding-top: 7px;"></td></tr>
				<tr>
					<td>Re-Type new Password<font size="2" style="color:red">*</font></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input name="checkPass"	type="password" id="checkPass" onblur="hide_retype();"	onclick="hide_retype();" onchange="hide_retype();">
						<div id="checkpasstd" style="display: none; color: red;;font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;Re-typed password is not matched</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"></td>
				</tr>
				
			</table>
			<div align="center" class="sucmain" id="success" style="display: none;">
						<div id="mydiv" name="mydiv" class="successBlk" align="center">
						<b>
						<img src="<%=request.getContextPath()%>/images/success.png" style="width: 18px;"/>
								Your Password is changed successfully.
						</b><span style="float: right;margin-right: 8px;cursor: pointer;"><a onclick="disNone11('success');" style="color: black;font-weight: 600;">X</a></span>
			</div></div>
			<div align="center" class="errmain" id="invalPass" style="display: none;">
						<div id="mydiv" name="mydiv" class="errorBlk" align="center">
						<b>
						<img src="<%=request.getContextPath()%>/images/error.png" style="width: 15px"/>
								You have entered wrong old password
						</b><span style="float: right;margin-right: 8px;cursor: pointer;"><a onclick="disNone11('invalPass');" style="color: black;font-weight: 600;">X</a></span>
					</div></div>
</div>

<table align="center">
	<tr>
		<td align="center" style="padding-top: 15px;">
		<input	type="button" class="submit" onclick="checkinfoadmin();" value="Change Password"></td>
		<td align="center" style="padding-top: 15px;">
		<input	type="reset" value="Reset"></td>
	</tr>
</table>

</form:form>
</body>
<script type="text/javascript">
function disNone11(divb){
	document.getElementById(divb).style.display = 'none';
}
</script>
</html>