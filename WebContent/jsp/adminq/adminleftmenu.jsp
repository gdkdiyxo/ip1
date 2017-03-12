<script type="text/javascript">
function loadAddBalanceSheet(){
	document.adminform.action="loadAddBalanceSheet.htm";
	document.adminform.submit();
}
function loadAddAlbum(){
	document.adminform.action="loadAddAlbum.htm";
	document.adminform.submit();
}
function loadAddImages(){
	document.adminform.action="loadAddImages.htm";
	document.adminform.submit();
}
function loadManageBalanceSheet(){
	document.adminform.action="loadManageBalanceSheet.htm";
	document.adminform.submit();
}
function adminChangePassword(){
	document.adminform.action="adminChangePassword.htm";
	document.adminform.submit();
}

function donationform(){
	document.adminform.action="donationForm.htm";
	document.adminform.submit();
}

function saveDonationForm(){
	if(confirm("Do you want to save ???")){
		document.adminform.action = "saveDonationForm.htm";
		document.adminform.submit();
	}
}
function deleteDonors(){

	document.adminform.action = "loaddeleteDonors.htm";
	document.adminform.submit();
}

function del(id){
	document.getElementById("hideid").value = id;
	if(confirm("This record will be deleted permanently. Do you want to delete ???")){
		document.adminform.action = "deleteDonor.htm";
		document.adminform.submit();
	}
}

function hide(id, value){
	
	if(confirm("Do you want to "+value+" this record on homepage???")){
		document.adminform.action = "hideDonor.htm?id="+id+"&val="+value+"";
		document.adminform.submit();
	}
}

function logoutnow(){
	if(confirm("Do you want to Logout ?")){
	document.adminform.action = "logoutnow.htm";
	document.adminform.submit();
	}
}

function getAlbumImages(id){
	document.adminform.action = "getAlbumImages.htm?id="+id+"";
	document.adminform.submit();
}

function gotocont(){
	document.adminform.action = "uploadMulitpleImages.htm";
	document.adminform.submit();
}

function search(){

	var name = document.getElementById("name").value;
	var purpose = document.getElementById("donation_purpose").value;
	var country = document.getElementById("country").value;
	var year = document.getElementById("year").value;
	document.adminform.action = "ajaxloaddeleteDonors.htm?name="+name+"&purpose="+purpose+"&country="+country+"&year="+year+"";
	document.adminform.submit();
// 	var url = "ajaxloaddeleteDonors.htm?name="+name+"&purpose="+purpose+"&country="+country+"+&year="+year+"";

	
}



function changeclass(){
		<% String sel=null;
		if(null != request.getAttribute("class")){
			sel = (String) request.getAttribute("class");
			System.out.println("---> "+sel);
		}
	%>
		document.getElementById('<%= sel%>').className = 'activate';
	
}

</script>
<body onload="changeclass();onLoadBack();">
<div class="menu">
<ul>
	<li id="donform" onclick="donationform();">Donation Form</li>
	<li id="mandon" onclick="deleteDonors();">  Manage Donors </li>

	<li id="addsheet" onclick="loadAddBalanceSheet();">Add Balance Sheet</li>
	<li id="manbal" onclick="loadManageBalanceSheet();">Manage Balance Sheet</li>
	<li id="addalb" onclick="loadAddAlbum();">Add Album</li>
	<li id="addimg" onclick="loadAddImages();">Add Images to Album</li>
	
	<li id="adminpassword" onclick="adminChangePassword();">Change Password</li>
	<li onclick="logoutnow();">Logout</li>
</ul>
</div>
<%if(null==session.getAttribute("admin")){
	session.invalidate();%>
	<input type="hidden" value="999" id="vbct_id">
<%}else{%>
	<input type="hidden" value="555" id="vbct_id">
<%}%>
</body>
<script>
 function onLoadBack(){
		var rr = document.getElementById("vbct_id").value;
		if(rr.match("999")){
			alert("Session expired. Please Login again");
			document.adminform.action = "goHome.htm";
			document.adminform.submit();
		}
	 }
</script>
