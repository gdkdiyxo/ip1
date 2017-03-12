<%@page import="com.ict.trust.vbct.model.Login"%>
<%@page import="java.util.HashMap"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/img/sm.jpg" type="image/x-icon">
<html manifest="vbct-cache-welcome.appcache">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VBCT | Error</title>
<link href="<%=request.getContextPath()%>/css/asd.css" rel="stylesheet"
	type="text/css" media="screen" />
<script type="text/javascript">
	function checkLoginRepr() {
		document.home.action = "checklogin.htm";
		document.home.submit();
	}
	function selectMenu(sel) {
		document.getElementById(sel).className = 'activate';
	}
</script>
</head>
<body>
	<form:form name="home">
		<div class="maindiv"
			style="background: transparent linear-gradient(rgb(204, 136, 127) 35%, rgb(247, 196, 151) 37%, rgb(217, 164, 158) 81% ) repeat scroll 0% 0%; border-bottom: 3px solid rgb(150, 18, 0);">
			<table
				style="height: 115px;background-image: url('<%=request.getContextPath()%>/img/contactus_TopBanner1.png');"
				border="0" class="position">
				<tr>
					
					<td align="center"><span class="headtitle"> Interrnship Manaagement System </span></td>
					
				</tr>
				<tr>
					<td align="right" style="height: 20px;"></td>
				</tr>
			</table>
		</div>
		<div class="maindiv">
			<table class="position" style="height: 500px" border="0">
				<tr>
					<td
						style="width: 190px; vertical-align: top; border-right: 1px solid lightgray;">
						<%@include file="../leftmenu.jsp"%>
					</td>
					<td style="vertical-align: top; padding: 2px 5px 5px 10px;">
						<div class="maindiv">
							<h1 align="center">Interrnship Manaagement System</h1><br>
							<table width="80%" align="center"
								style="border: 2px black solid;">
								<tr>
									<th width="30%" style="background:">Type of Problem</th>
									<th width="60%">Description</th>
								</tr>
								<tr style="background-color: #EAEAEA">
									<td width="30%" style="padding-left: 10px;">Internet
										connection</td>
									<td width="60%" style="padding-left: 10px;">1). It may be
										possible that your Internet connectivity drop.<br />2).Bad
										Internet connectivity<br />

									</td>
								</tr>
								<tr style="background-color: #EAEAEA">
									<td width="30%" style="padding-left: 10px;">Server side
										issues</td>
									<td width="60%" style="padding-left: 10px;">1). Server
										side internal errors are occurred.<br />2). Server not
										responding properly<br />3). Invalid url pattern access.
									</td>
								</tr>
							</table>
							
			</table>
		</div>
		<div class="maindiv"
			style="background: #DDB2AB linear-gradient(#FFF 2%, #F0C2AB 6%, #D3978F 47%) repeat scroll 0% 0%">
			<table class="position" border="0" style="height: 30px">
				<tr>
					<td><span>Terms & Conditions </span> |<span
						style="margin-left: 10px">Privacy Policy</span> <!-- |<span style="margin-left: 10px">© Copyright 2015</span> -->
					</td>
					<td style="width: 125px">
						<div style="" class="unselectable">
							<font style="padding-bottom: 15px; vertical-align: middle;">©
								Copyright 2016</font>
							<!-- <a href="#" title="hit counter"><img src="http://counter2.bestfreecounterstat.com/private/freecounterstat.php?c=e6d3443d9d9d9ec9483ea9340c47bb5b" border="0" title="hit counter" alt="hit counter"></a> -->
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form:form>
</body>
</html>