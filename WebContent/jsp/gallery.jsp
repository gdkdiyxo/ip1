<%@page import="com.ict.trust.vbct.model.AddAlbumBO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<link href="<%=request.getContextPath()%>/jsp/gallery/css/jquery.fancybox.css?v=2.0.5" rel="stylesheet" type="text/css" media="screen" />
        <link href="<%=request.getContextPath()%>/jsp/gallery/css/jquery.picasagallery.css" rel="stylesheet" type="text/css" media="screen" />
        <link href="<%=request.getContextPath()%>/jsp/gallery/css/jquery.fancybox-thumbs.css?v=2.0.5" rel="stylesheet" type="text/css" media="screen" />
        <script src="<%=request.getContextPath()%>/jsp/gallery/js/jquery.min.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/jsp/gallery/js/jquery.mousewheel-3.0.6.pack.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/jsp/gallery/js/jquery.fancybox.pack.js?v=2.0.5" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/jsp/gallery/js/jquery.fancybox-thumbs.js?v=2.0.5" type="text/javascript"></script>
<%--         <script src="<%=request.getContextPath()%>/jsp/gallery/js/jquery.picasagallery.js" type="text/javascript"></script> --%>
       <!--  <script type="text/javascript">
            $(document).ready(function() { $('.picasagallery').picasagallery({username:'alan.hamlett'}); } );
        </script> -->
        <style type="text/css">
        .albimga{
        	cursor: pointer;
        	border: 1px solid #fff;
        	padding: 8px 3px 2px 3px;
        }
        .albimga:HOVER {
			border: 1px solid #D6D6D6;
			box-shadow: 1px 1px #FFF;
			background-color: #E5E6E6;
			
		}
		.alimg{
			background-image: url("<%=request.getContextPath()%>/img/al2.png");
			background-size: 100% 100%;
	
		}
        </style>
</head>
<body onload="selectMenu('gallery');">	
		<h1 align="center">Gallery</h1>
<!--         <div class='picasagallery'></div> -->
        
        <div>
        <% List<AddAlbumBO> list = null;
        if(null != request.getAttribute("list")){ 
        	list = (List<AddAlbumBO>) request.getAttribute("list");
        	System.out.println(list.size());
        }
        %>
        <% for(AddAlbumBO a : list){ %>
        <div class="picasagallery_album albimga" >
        <input type="hidden" name="<%=a.getAlbum_id()%>" value="<%=a.getAlbum_name()%>">
        <% if(null != a.getCount()){ %>
        <a onclick="getAlbumImages('<%=a.getAlbum_id() %>');" class="">
        <%}else{ %>
        <a onclick="alert('No images available in this Album.');">
        <%} %>
        <div class="alimg">
        <img src="<%= a.getAlbum_title_img() %>" alt="Album Image" title="<%= a.getAlbum_name() %>" 
        style="width: 190px;
			   height: 150px;"></div>
		</a>
        <p><strong><%= a.getAlbum_name().toUpperCase() %></strong></p>
        <% if(null != a.getCount()){ %>
        <p><strong><%= a.getCount()%> Photos</strong></p>
        <%}else{ %>
        <p><strong>No images in this album.</strong></p>
        <%} %>
<!--         <p>6 photos</p> -->
        </div>
        <%} %>
        
        </div>
</body>
</html>