<script type="text/javascript">
function login(){
	document.home.action = "login.htm";
	document.home.submit();
}
function loadlogin(){
	document.home.action = "loadlogin.htm";
	document.home.submit();
}
function goHome(){
	document.home.action = "goHome.htm";
	document.home.submit();
}
function aboutUs(){
	document.home.action = "aboutUs.htm";
	document.home.submit();
}
function donorList(){
	document.home.action = "donorList.htm";
	document.home.submit();
}
function sheetList(){
	document.home.action = "sheetList.htm";
	document.home.submit();
}
function gallery(){
	document.home.action = "gallery.htm";
	document.home.submit();
}
function trustees(){
	document.home.action = "trustees.htm";
	document.home.submit();
}
function contact(){
	document.home.action = "contact.htm";
	document.home.submit();
}
function getList(date){
	document.home.action = "donorList.htm?date="+date+"";
	document.home.submit();
}
function viewAlbum(){
	document.home.action = "viewAlbum.htm";
	document.home.submit();
}
function getAlbumImages(id){
	document.home.action = "getAlbumImages.htm?id="+id+"";
	document.home.submit();
}
function backTogallery(){
	document.home.action = "viewAlbum.htm";
	document.home.submit();
}
function logoutnow(){
	if(confirm("Do you want to Logout ?")){
	document.home.action = "logoutnow.htm";
	document.home.submit();
	}
	}
</script>
<div class="menu">
<ul>
	<!-- <li id="home" onclick="goHome();" >Home</li>
	<li id="about" onclick="aboutUs();">About us </li>
	<li id="trust" onclick="trustees();">Founder & Trustees</li>
	<li id="donor" onclick="donorList();">Foreign Donors</li>
	<li id="balance" onclick="sheetList();">Balance sheet</li>
	<li id="gallery" onclick="viewAlbum();">Gallery</li>
	<li id="contact" onclick="logoutnow();">logoutnow</li> -->
</ul></div>