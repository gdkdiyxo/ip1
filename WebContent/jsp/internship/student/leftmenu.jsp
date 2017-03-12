<script type="text/javascript">
function login(){
	document.home.action = "login.htm";
	document.home.submit();
}
function joblist(){
	document.home.action = "joblist.htm";
	document.home.submit();
}
function student_skill(){
	document.home.action = "student_skill.htm";
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
function student_basic_info(){
	document.home.action = "student_basic_info.htm";
	document.home.submit();
}
function student_edu(){
	document.home.action = "student_edu.htm";
	document.home.submit();
}
function getList(date){
	document.home.action = "donorList.htm?date="+date+"";
	document.home.submit();
}
function student_certi(){
	document.home.action = "student_certi.htm";
	document.home.submit();
}
function student_work(){
	document.home.action = "student_work.htm";
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
	<li id="home" onclick="goHome();" > Student Home</li>
	<li id="joblist" onclick="joblist();">Job list</li>
		<li id="joblist" onclick="student_skill();">Student Skill</li>
	<li >Student Profile
		<ul>
		<li id="student_basic_info" onclick="student_basic_info();">Student Basic Info</li>
	<li id="student_edu" onclick="student_edu();">Student Education detail</li>
		<li id="student_certi" onclick="student_certi();">Student Certificate detail</li>
				<li id="student_certi" onclick="student_work();">Student Work  Experience</li>
		
	
	<!-- <li id="internship" onclick="internshp_type();">Internship Type Report</li>
	<li id="gpa" onclick="gpa_report();">GPA wise Report</li> -->

		</ul>
		</li>
	
		<li onclick="logoutnow();">Logout</li></ul></div>
