<%@page import="com.ict.trust.vbct.model.DonationBO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8">
<!-- auto complete -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/autofill/jquery-ui.css">
 <!-- auto complete -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/allvalidation.js"></script>
<script type="text/javascript">
	function validate() {
		var flag = true;
		if (document.getElementById("donor_name").value === "") {
			document.getElementById("donor_name1").style.display = "block";
			flag = false;
		}
		if (document.getElementById("donation_amount").value === "") {
			document.getElementById("donation_amount1").style.display = "block";
			flag = false;
		}
		if (document.getElementById("email").value === "") {
			document.getElementById("email1").style.display = "block";
			flag = false;
		}
		if (document.getElementById("address").value === "") {
			document.getElementById("address1").style.display = "block";
			flag = false;
		}
		
		if (document.getElementById("receipt_no").value === "") {
			document.getElementById("receipt_no1").style.display = "block";
			flag = false;
		}
		
		if (document.getElementById("receipt_dt").value === "") {
			document.getElementById("receipt_dt1").style.display = "block";
			flag = false;
		}
		if (document.getElementById("country").value === "Select") {
			document.getElementById("country1").style.display = "block";
			flag = false;
		}
		
		if (document.getElementById("donation_purpose").value === "Select") {
			document.getElementById("donation_purpose1").style.display = "block";
			flag = false;
		}
		
		if (document.getElementById("pay_mode").value === "Select") {
			document.getElementById("pay_mode1").style.display = "block";
			flag = false;
		}
		if (document.getElementById("mobile_number").value === "") {
			document.getElementById("mobile_number1").style.display = "block";
			flag = false;
		}
		if (flag) {
			saveDonationForm();
		} else {
			return false;
		}

	}

	function mobileValidation(mble) {
		var val = mble.value;
		if (/^[0-9]{10,10}$/.test(val)) {
			return true;
		} else {
			alert("Please enter valid mobile no");
			mble.value = "";
			mble.focus();
			return false;
		}
	}

	function validateEmail(txtinput) {
		var ck_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([A-Za-z]{2,6}(?:\.[a-z]{2})?)$/;
		{
			if (!txtinput.value == "") {
				if (txtinput.value.match(ck_email)) {

					return true;
				} else {
					txtinput.value = "";
					txtinput.focus();
					alert('Please Enter Valid Email ');
					return false;
				}
			}
		}
	}

	function hideDiv(name) {

		document.getElementById(name + "1").style.display = "none";
	}

	function onlynumbers(form) {
		if (isNaN(form.value)) {
			alert('Please Enter Numeric Values Only');
			form.focus();
			form.value = "";
			return false();
		} else
			return true;
	}
</script>

</head>
<body onload="changeclass();">
	<form:form modelAttribute="donation">

		<h1 align="center">Donation Form</h1>
		<br />
<div class="formdesign">
			<div><h4 align="center" style="margin: 5px 2px;color: #961200;">Personal details</h4>
			<span id="notice" style="font-size: 12px; color: red; display: block; align:right">* Mandatory fields</span></div>
			<table align="center" width="100%">
			<tr>
				<td align="left"><b>Full Name : <span style="font-size: 15px; color: red;">*</span>
				</b></td>
				<td><div class="ui-widget"><input type="text" name="donor_name" id="donor_name"
					onclick="hideDiv(this.name);" onchange="onlyalphabetwithspace(this);hideDiv(this.name);"
					onblur="hideDiv(this.name);" onkeyup="getDonorByNameAjaxVal(this.value);" ></div>
					<div id="donor_name1"
						style="font-size: 12px; color: red; display: none;">You
						cannot leave this empty.</div></td><td align="left"><b>Country : <span
						style="font-size: 15px; color: red;">*</span></b></td>
				<td><select onclick="hideDiv(this.name);" id="country"
					name="country" style="margin-top: 5px" onblur="hideDiv(this.name);setStdTomobile(this.id);" onkeyup="setStdTomobile(this.id);" onchange="setStdTomobile(this.id);hideDiv(this.name);">
						<option value="Select">--Select--</option>
						<c:forEach var="lst" items="${requestScope.list}">
							<option id="${lst.country_std_code}"
								 value="${lst.country_name}">${lst.country_name} (${lst.country_std_code})</option>
						</c:forEach>
				</select>
					<div id="country1"
						style="font-size: 12px; color: red; display: none;">You
						cannot leave this empty.</div></td>
			</tr>
			<tr>
				<td align="left"><b>Mobile Number : <span
						style="font-size: 15px; color: red;">*</span></b></td>
				<td><input type="text" id="std_code" name="std_code" style="width: 40px"
					readonly="readonly"> <input onclick="hideDiv(this.name);"
					type="text" id="mobile_number" style="width: 135px" name="mobile_number"
					onchange="onlynumbers(this);hideDiv(this.name);" onblur="hideDiv(this.name);" maxlength="20" />
					<div id="mobile_number1"
						style="font-size: 12px; color: red; display: none;">You
						cannot leave this empty.</div></td>
				<td align="left"><b>Email-ID : <span
						style="font-size: 15px; color: red;">*</span></b></td>
				<td><input onclick="hideDiv(this.name);" onblur="hideDiv(this.name);" type="text"
					name="email" id="email" placeholder="exmaple@xyz.xyz" onchange="validateEmail(this);hideDiv(this.name);" />
					<div id="email1"
						style="font-size: 12px; color: red; display: none;">You
						cannot leave this empty.</div></td>
			</tr>
			<tr >
			<td align="left"><b>Address :<span style="font-size: 15px; color: red;">*</span></b></td>
				<td><textarea name="address" id="address" placeholder='Colony,City,State'></textarea>
			<div id="address1"
						style="font-size: 12px; color: red; display: none;">You
						cannot leave this empty.</div></td>	
				<td></td>
			</tr>
		</table><br/></div><br/>
		<div class="formdesign">
		<h4 align="center" style="margin: 5px 2px;color: #961200;">Donation details</h4><table width="100%">
		<tr>
				<td align="left"><b>Receipt number : <span style="font-size: 15px; color: red;">*</span>
				</b></td>
				<td><input type="text" name="receipt_no" id="receipt_no"
					onclick="hideDiv(this.name);" onchange="alphanumber(this);hideDiv(this.name);"
					onblur="hideDiv(this.name);">
					<div id="receipt_no1"
						style="font-size: 12px; color: red; display: none;">You
						cannot leave this empty.</div></td>
				<td align="left"><b>Receipt Date : <span
						style="font-size: 15px; color: red;">*</span></b></td>
				<td><input type="text" name="receipt_dt" id="receipt_dt" placeholder="DD/MM/YYYY"
					onclick="hideDiv(this.name);" onchange="ddmmyyyycheckReceipt(this);checkfuturedate(this);hideDiv(this.name);"
					onblur="hideDiv(this.name);" style="height: 26px; width: 180px;">
					<script type="text/javascript">
						//<![CDATA[ 
						$("#receipt_dt").kendoDatePicker({
							format : "dd/MM/yyyy",
							parseFormats : [ "dd/MM/yyyy" ]
						});
						//]]>
					</script>
					<div id="receipt_dt1"
						style="font-size: 12px; color: red; display: none;">You
						cannot leave this empty.</div></td>
				
			</tr><tr><td colspan="4"></td></tr>
		<tr style="margin-top: 15px;">
			<td align="left"><b>Purspose Of Donation : <span
						style="font-size: 15px; color: red;">*</span></b></td>
				<td><select onclick="hideDiv(this.name);" id="donation_purpose"
					name="donation_purpose" onchange="hideDiv(this.name);" onblur="hideDiv(this.name);">
						<option value="Select">--Select--</option>
						<option value="Devka school">Devka school</option>
						<option value="Devka college">Devka college</option>
						<option value="Gau shalla">Gau shalla</option>
						<option value="Other">Other</option>
				</select>
				
				<div id="donation_purpose1"
						style="font-size: 12px; color: red; display: none;">You
						cannot leave this empty.</div>
				</td>
				<td align="left"><b>Contribution Mode : <span
						style="font-size: 15px; color: red;">*</span></b></td>
				<td><select onclick="hideDiv(this.name);" onchange="hideDiv(this.name);" onblur="hideDiv(this.name);" id="pay_mode"
					name="pay_mode">
						<option value="Select">--Select--</option>
						<option value="Cash">Cash</option>
						<option value="Cheque">Cheque</option>
						<option value="Online Banking">Online Banking</option>
						<option value="Credit Card">Credit Card</option>
						<option value="Debit Card">Debit Card</option>
				</select>
				
				<div id="pay_mode1"
						style="font-size: 12px; color: red; display: none;">You
						cannot leave this empty.</div>
				
				</td>
				<td align="left"></td>
			</tr>
			<tr >
			<td align="left" ><b>Amount of Donation : <span
						style="font-size: 15px; color: red;">*</span></b></td>
				<td><label class="rupees"><img src="<%=request.getContextPath()%>/img/rupee.png" style="width: 14px;"/></label> <input type="text"
					name="donation_amount" id="donation_amount"
					onclick="hideDiv(this.name);"
					onchange="onlynumbers(this);hideDiv(this.name);"
					onblur="hideDiv(this.name);" style="width: 161px" />
					<div id="donation_amount1"
						style="font-size: 12px; color: red; display: none;">You
						cannot leave this empty.</div></td>
			<td align="left"><b>Remarks :</b></td>
				<td><textarea name="remarks" id="remarks" placeholder="Remarks if any"></textarea></td>	
			</tr></table><br/></div><br/>
			<div align="center"><input type="button" value="Submit"
					onclick="validate();" /><input type="reset" value="Reset" style="margin-left: 5px"/></div>
	</form:form><br/>
	<div id="ajaxList">
		<table id="ajaxTable" width="100%" class="vbcttbl"></table>
	</div>
</body>
<script type="text/javascript">
	function setDatainText(rowid){
		document.getElementById("donor_name").value = document.getElementById("name_"+rowid).value;
		document.getElementById("mobile_number").value = document.getElementById("mob_"+rowid).value;
		document.getElementById("country").value = document.getElementById("country_"+rowid).value;
		document.getElementById("email").value = document.getElementById("email_"+rowid).value;
		document.getElementById("std_code").value = document.getElementById("std_"+rowid).value;
		document.getElementById("address").value = document.getElementById("addr_"+rowid).value;
	}
	function setStdTomobile(countrycode) {
		var cou = document.getElementById(countrycode).options[document.getElementById(countrycode).selectedIndex].text;
		var code = cou.split("+")[1].split(")")[0];
		document.getElementById("std_code").value ="+"+code;
		
	}
	function getDonorByNameAjaxVal(name) {
		if(name.length<4){
			
		}else{
		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("ajaxTable").innerHTML = xmlhttp.responseText;
			}
		};
		var url = "getDonorByNameAjax.htm?name="+name;
		xmlhttp.open("POST", url, true);
		xmlhttp.send();
		}
	}
</script>
 <script src="<%=request.getContextPath()%>/js/autofill/jquery-1.10.2.js"></script>
 <script src="<%=request.getContextPath()%>/js/autofill/jquery-ui.js"></script>
<%-- <script type="text/javascript">
<%if(null!=request.getAttribute("lstDonor")){
%>
$(function() {
  var availableTags = [
	<c:forEach var="lstdonor" items="${requestScope.lstDonor}">
		"<c:out value="${lstdonor.donor_name}"/> (<c:out value="${lstdonor.country}"/>)",
	</c:forEach>
  ];
  var filltag = [
    <c:forEach var="lstdonor" items="${requestScope.lstDonor}">
         "<c:out value="${lstdonor.donor_name}"/>",
    </c:forEach>
  ];
  $( "#donor_name" ).autocomplete({
    source: availableTags
  });
});
<%}%>
</script> --%>
</html>