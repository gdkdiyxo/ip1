<!DOCTYPE>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Image upload</title>
<script src="<%= request.getContextPath() %>/jsp/gallery/css/jquery.min.js"></script>

<link href="<%= request.getContextPath() %>/jsp/mutliDrop/style.css" type="text/css" rel="stylesheet" />

<script type="text/javascript">
var config = {
	support : "image/jpg,image/png,image/bmp,image/jpeg,image/gif",		// Valid file formats
	form: "multiUpload",					// Form ID
	dragArea: "dragAndDropFiles",		// Upload
	uploadUrl: "uploadMulitpleImages.htm",
		form1: "submitHandler"				// Server side upload url
};
$(document).ready(function(){
	initMultiUploader(config);
});
</script>

<script type="text/javascript" src="<%= request.getContextPath() %>/jsp/mutliDrop/multiupload.js"></script>

<script type="text/javascript">

function validate(){
	var flag = true;
	if(document.getElementById("album").value == "Select"){
		alert("Any one Album Name must be selected.");
		flag = false;
	}
	var aqw = document.getElementById("dragAndDropFiles").innerHTML;
	if(aqw.length == 28){
		alert("Atleast One image should be selected.");
		flag = false;
	}

	if(flag){
		asd();
	}
}

function asd(){
	var i=0;
	var length = document.getElementById("dragAndDropFiles").getElementsByTagName('div').length;
	for(i=0; i< length;i++){
		var checkbox = document.createElement("input");
		checkbox.type = "checkbox";
		checkbox.checked = "checked";
		checkbox.name = "datasrc";
		checkbox.style = "display:none";
		checkbox.value = document.getElementById(i).src;
		checkbox.id = "id";
		document.getElementById("hello").appendChild(checkbox);
	}

	gotocont();

}

</script>
</head>
<body>
<form name="imageform123">

<h1 align="center"> Add Images </h1>

<div align="center">
<b>Select Album Name : <span style="color: red;font-size: 16px;">*</span></b> 
<select name="album" id="album">
<option value="Select">-- Select --</option>
<c:forEach var="album" items="${requestScope.album}">
<option value="${album.album_id }">${album.album_name}</option>
</c:forEach>
</select>
</div>
<h2 class="title" align="center">Multiple Drag and Drop File Upload</h2>

<div id="dragAndDropFiles" class="uploadArea">
	<h1>Drop Images Here</h1>
</div>
<div id="hello" style="display: none"></div>
<input type="file" name="multiUpload" id="multiUpload" multiple/>
<input type="button" value="Upload" class="buttonUpload" onclick="validate();" />


</form>
</body>

</html>