<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VBCT | Admin</title>
<link href="<%=request.getContextPath()%>/css/asd.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/allvalidation.js"></script>

<!-- datepicker -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/datepicker/jquery-1.7.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/datepicker/kendo.all.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datepicker/kendo.common.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/datepicker/kendo.default.min.css">
<!-- datepicker -->	

<!-- Tooltip -->
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/css/tooltip.css" />
<script type="text/javascript"	src="<%=request.getContextPath()%>/js/tooltip.js"></script>
<!-- Tooltip -->

<script type="text/javascript">

function login(){
	document.home.action = "login.htm";
	document.home.submit();
}
function Hide(msg) {
	document.getElementById(msg.id+"1").style.display = "none";
}
</script>
<!-- 
<script type="text/javascript">
setTimeout(function() {
   document.getElementById("mydiv").style.display = "none";
}, 4000); // <-- time in milliseconds


</script>

<style type="text/css">
li {
	padding: 7px 7px 7px 15px;
	border: 1px solid white;
}
li:HOVER {
	border: 1px solid lightgray;
	cursor: pointer;
}
.unselectable {
    -moz-user-select: -moz-none;
    -khtml-user-select: none;
    -webkit-user-select: none;
    -o-user-select: none;
    user-select: none;
}
</style>
 -->

