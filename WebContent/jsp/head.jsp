<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VBCT</title>
<link href="<%=request.getContextPath()%>/css/asd.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript">
	function checkLoginRepr(){
		var msg = "Please enter ";
		var flag = true;
		if(document.getElementById("username").value == "")
		{
			/* document.getElementById("username1").style.display = "block"; */
			msg = msg + "username";
			flag = false;
			if(document.getElementById("password").value == "")
			{
				/* document.getElementById("password1").style.display = "block"; */
				msg = msg + " and password";
				flag = false;
			}
		}
		else if(document.getElementById("password").value == "")
		{
			/* document.getElementById("password1").style.display = "block"; */
			msg = msg + "password";
			flag = false;
		}
		
		if(flag)
		{
			document.home.action = "checklogin.htm";
			document.home.submit();
		}else{
			alert(msg);
		}
		
	}
	function selectMenu(sel) {
		document.getElementById(sel).className = 'activate';
	}
	function hiddee(){
		document.getElementById("mydiv").style.display = "none";
	}
	function Hide(msg) {
		document.getElementById(msg.id+"1").style.display = 'none';
	}
</script>
</head>