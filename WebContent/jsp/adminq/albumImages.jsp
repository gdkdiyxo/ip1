<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<!-- gallery scripts -->

<link href="<%=request.getContextPath()%>/jsp/gallery/css/jquery.fancybox.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<%=request.getContextPath()%>/jsp/gallery/css/jquery.picasagallery.css" rel="stylesheet" type="text/css" media="screen" />
<link href="<%=request.getContextPath()%>/jsp/gallery/css/jquery.fancybox-thumbs.css?v=2.0.5" rel="stylesheet" type="text/css" media="screen" />
<script src="<%=request.getContextPath()%>/jsp/gallery/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/jsp/gallery/js/jquery.mousewheel-3.0.6.pack.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/jsp/gallery/js/jquery.fancybox.pack.js?v=2.0.5" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/jsp/gallery/js/jquery.fancybox-thumbs.js" type="text/javascript"></script>

<!-- gallery scripts ends -->
<script type="text/javascript">

var index;
var size = <%= request.getAttribute("count")%>;
/* function openimage(val, id){
	document.getElementById("img").src = val;
	$("#pop").show(1000);
	$("#fancybox-overlay").show();
	$("#fancybox-thumbs").show(1000);
	
	/* document.getElementById("pop").style.display = "block";
	document.getElementById("fancybox-overlay").style.display = "block";
	document.getElementById("fancybox-thumbs").style.display = "block"; */
	/* document.getElementById(id).className = "active";
	
}

function close(){
	alert("hello");
	document.getElementById("pop").style.display = "none";
	document.getElementById("fancybox-overlay").style.display = "none";
	document.getElementById("fancybox-thumbs").style.display = "none";
} */
$(function() {
$('.picasagallery_thumbnail').click(function(){
	selectMenu('gallery');
	var id = $(this).attr("id");
	index = $(this).attr("title");
	$("#"+id+"li").attr("class","active");
	
	$("#img").attr("src", $(this).attr("name"));
	$("#pop").show(500);
	$("#fancybox-overlay").show();
// 	$("#fancybox-thumbs").show(500);
});

$('.fancybox-close').click(function(){
	$("#pop").hide(500);
	$("#fancybox-overlay").hide();
// 	$("#fancybox-thumbs").hide(500);
	$("li").removeClass();
	selectMenu('gallery');
});

$('.dondyoChodyo').click(function(){
	$("li").removeClass();
	selectMenu('gallery');
// 	$("#pop").hide(1000);
// 	$("#pop").show(1000);
	$("#img").attr("src", $(this).attr("name"));
	var id = $(this).attr("id");
	$("#"+id.split("I")[0]).attr("class","active");
	index = $("#"+id.split("I")[0]).attr("title");
	
});

$('.fancybox-next').click(function(){
	$("li").removeClass();
	selectMenu('gallery');
	var next = Number(Number(index)+1);
	if(next <= size){
		var idnext = $("#"+next).attr("name");
		$("#img").attr("src", $("#"+next).attr("src"));
		$("#"+idnext+"li").attr("class","active");
		index = next;
	}else{
		index = 1;
		var idnext = $("#"+index).attr("name");
		$("#img").attr("src", $("#"+index).attr("src"));
		$("#"+idnext+"li").attr("class","active");
	}
});

$('.fancybox-prev').click(function(){
	$("li").removeClass();
	selectMenu('gallery');
	var prev = Number(Number(index)-1);
	if(prev > 0){
		var idprev = $("#"+prev).attr("name");
		$("#img").attr("src", $("#"+prev).attr("src"));
		$("#"+idprev+"li").attr("class","active");
		index = prev;
	}else{
		index = size;
		var idprev = $("#"+index).attr("name");
		$("#img").attr("src", $("#"+index).attr("src"));
		$("#"+idprev+"li").attr("class","active");
		
	}
});

$(document).keydown(function(e){
    if (e.keyCode == 37) { 
       if(document.getElementById("pop").style.display == "block" || document.getElementById("pop").style.display == ""){
    	   $("li").removeClass();
    		selectMenu('gallery');
    		var prev = Number(Number(index)-1);
    		if(prev > 0){
    			var idprev = $("#"+prev).attr("name");
    			$("#img").attr("src", $("#"+prev).attr("src"));
    			$("#"+idprev+"li").attr("class","active");
    			index = prev;
    		}else{
    			index = size;
    			var idprev = $("#"+index).attr("name");
    			$("#img").attr("src", $("#"+index).attr("src"));
    			$("#"+idprev+"li").attr("class","active");
    			
    		}
        }
       return false;
    }

    if(e.keyCode == 39){
    	if(document.getElementById("pop").style.display == "block" || document.getElementById("pop").style.display == ""){
    		$("li").removeClass();
    		selectMenu('gallery');
    		var next = Number(Number(index)+1);
    		if(next <= size){
    			var idnext = $("#"+next).attr("name");
    			$("#img").attr("src", $("#"+next).attr("src"));
    			$("#"+idnext+"li").attr("class","active");
    			index = next;
    		}else{
    			index = 1;
    			var idnext = $("#"+index).attr("name");
    			$("#img").attr("src", $("#"+index).attr("src"));
    			$("#"+idnext+"li").attr("class","active");
    		}
    	}
    }
});

});



</script>
<style type="text/css">
.zoom-effect-container {
    float: left;
    position: relative;
    width: 185px;
    height: 185px;
    margin: 0 auto;
    overflow: hidden;
}

.image-card {
  position: absolute;
  top: 0;
  left: 0;
}

.image-card img {
  -webkit-transition: 0.4s ease;
  transition: 0.4s ease;
}

.zoom-effect-container:hover .image-card img {
  -webkit-transform: scale(1.08);
  transform: scale(1.08);
}
</style>
</head>
<body onload="selectMenu('gallery');">

<img onclick="backTogallery();" alt="Back" src="<%= request.getContextPath()%>/images/RV0OT2.png" style="position: absolute;height: 38px;cursor: pointer;" title="Back to Albums"><h1 align="center">${requestScope.name}</h1>
<c:set var="y" value="1"></c:set>
<c:forEach var="list" items="${requestScope.list}">
<a title="${y }" class="picasagallery_thumbnail" name="${list.gallery_img}" id="${list.gallery_id }">
<div class="zoom-effect-container">
  <div class="image-card">
<img src="${list.gallery_img}" style="width: 160px;height: 160px;"></div></div>
</a>
<c:set var="y" value="${y+1 }"></c:set>
</c:forEach>

<div id="pop" style="width: 722px; height: auto; display: none; top: 75px; left: 340px; opacity: 1; overflow: visible; position: fixed;" class="fancybox-wrap fancybox-desktop fancybox-default fancybox-opened">

<div style="padding: 15px; width: auto; height: auto;" class="fancybox-outer">

<div style="width: 692px; height: 456px; overflow: visible;" class="fancybox-inner">

<img id="img" class="fancybox-image" alt="">
<a title="Previous" class="fancybox-nav fancybox-prev"><span></span></a>
<a title="Next" class="fancybox-nav fancybox-next"><span></span></a>
</div>
<div title="Close" class="fancybox-close"></div>
</div>
</div>
<div id="fancybox-overlay" style="background: black none repeat scroll 0% 0%; cursor: pointer; width: 100%; height: 100%; opacity: 0.8; display: none;"></div>

<div class="bottom" id="fancybox-thumbs" style="display: none;">
<ul style="width: 588px; left: 382px;">
<c:set var="count" value="1"></c:set>
<c:forEach var="list" items="${requestScope.list}">
<li id="${list.gallery_id}li" title="${count}">
<a id="${list.gallery_id}liImg" style="width:80px;height:80px;" name="${list.gallery_img}" class="dondyoChodyo">

<img name="${list.gallery_id}" id="${count}" src="${list.gallery_img}" style="width: 80px; height: 80px; top: 0px; left: 0px; display: block;">
</a>
</li>
<c:set var="count" value="${count+1}"></c:set>
</c:forEach>
<!-- <li><a style="width:80px;height:80px;" href="javascript:jQuery.fancybox.jumpto(1);"><img style="width: 80px; height: 80px; top: 0px; left: 0px; display: block;" src="https://lh3.googleusercontent.com/-07vqcp2hjYg/UBMefdOzXzI/AAAAAAAAlzc/gZuIVF9AS7A/s160-c/DSC01566.JPG"></a></li><li><a style="width:80px;height:80px;" href="javascript:jQuery.fancybox.jumpto(2);"><img style="width: 80px; height: 80px; top: 0px; left: 0px; display: block;" src="https://lh3.googleusercontent.com/-XasI5qvya_I/UBMeffFaXyI/AAAAAAAAlzw/xmqj3jT1Sl0/s160-c/DSC01600.JPG"></a></li><li><a style="width:80px;height:80px;" href="javascript:jQuery.fancybox.jumpto(3);"><img style="width: 80px; height: 80px; top: 0px; left: 0px; display: block;" src="https://lh3.googleusercontent.com/-EgNfp6OVXZs/UBMefSGLwhI/AAAAAAAAlzs/lyZMVzUeZq8/s160-c/DSC01648.JPG"></a></li><li><a style="width:80px;height:80px;" href="javascript:jQuery.fancybox.jumpto(4);"><img style="width: 80px; height: 80px; top: 0px; left: 0px; display: block;" src="https://lh3.googleusercontent.com/-ypO5gp_BjTQ/UBMefVSB8_I/AAAAAAAAlzo/2o3yf_PTEaA/s160-c/DSC01522.JPG"></a></li><li><a style="width:80px;height:80px;" href="javascript:jQuery.fancybox.jumpto(5);"><img style="width: 80px; height: 80px; top: 0px; left: 0px; display: block;" src="https://lh3.googleusercontent.com/-QS4oHlbB94s/UBMfKdSXUPI/AAAAAAAAlzg/lj7asUHY8dI/s160-c/DSC01706.JPG"></a></li> -->
</ul>
</div>

</body>
</html>