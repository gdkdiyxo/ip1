<script type="text/javascript">
function login(){
	document.home.action = "login.htm";
	document.home.submit();
}
function loadlogin(){
	document.home.action = "loadlogin.htm";
	document.home.submit();
} 
function skill(){
	document.home.action = "loadSkill.htm";
	document.home.submit();
}

function job() {
	document.home.action = "loadjob.htm";
	document.home.submit();
}

function student_info() {
	document.home.action = "loadstudentForm.htm";
	document.home.submit();
}
function company(){
	document.home.action = "addcompany.htm";
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
function internshp(){
	document.home.action = "loadinternship.htm";
	document.home.submit();
}
function internshp_status() {
	document.home.action = "loadinternship_status.htm";
	document.home.submit();
}
function student_report() {
	document.home.action = "student_report.htm";
	document.home.submit();
}

function company_report() {
	document.home.action = "company_report.htm";
	document.home.submit();
}
function internshp_type() {
	document.home.action = "internshp_type_report.htm";
	document.home.submit();
}
function gpa_report(){
document.home.action = "gpa_report.htm";
	document.home.submit();

}
function job_report(){
document.home.action = "job_report.htm";
	document.home.submit();

}

function approved_student() {
	document.home.action = "approved_student.htm";
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
	<li id="home" onclick="goHome();" >Home</li>
	<li id="skill" onclick="skill();" >Skill</li>
	<li id="job" onclick="job();">Job Master </li>
	<li id="student_info" onclick="student_info();">Student Info</li>
	<li id="donor" onclick="company();">Company</li>
	<li id="internship" onclick="internshp();">Internship Type</li>
	<li id="internship" onclick="internshp_status();">Student Internship Status</li>
		<li id="approved_student" onclick="approved_student();">Approved Student</li>
	
		<li >Reports
		<ul>
		<li id="student_report" onclick="student_report();">Student Report</li>
	<li id="donor" onclick="company_report();">Company</li>
	<li id="internship" onclick="internshp_type();">Internship Type Report</li>
	<li id="gpa" onclick="gpa_report();">GPA wise Report</li>
		<li id="job" onclick="job_report();">job Report</li>
	

		</ul>
		</li>
	

	<li onclick="logoutnow();">Logout</li></ul></div>