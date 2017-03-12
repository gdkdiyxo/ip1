<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <html>
        <head>
  <meta charset="utf-8">
  <title>jQuery UI Tabs - Content via Ajax</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  
      <link href="<c:url value="/css/jquery.dataTables.min.css" />" rel="stylesheet">
 
     <script src="<c:url value="/js/jspdf.debug.js" />"></script>
    <script src="<c:url value="/js/jquery.dataTables.min.js" />"></script>
  <script>
  $(function() {
    $( "#tabs" ).tabs({
      beforeLoad: function( event, ui ) {
        ui.jqXHR.fail(function() {
          ui.panel.html(
            "Couldn't load this tab. We'll try to fix this as soon as possible. " +
            "If this wouldn't be a demo." );
        });
      }
    });
  });
   

  </script>

  
</head>
<body>
 
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Reports</a></li>
    <li><a href="#tt">Employers</a></li>
    
  </ul>
  <div id="tabs-1">
<jsp:include page="/jsp/internship/admin/search_report.jsp" />   </div>
 
  <div id="tt">
<jsp:include page="/jsp/internship/admin/search_report_employers.jsp" />   </div>
 </div>
 </body>
 </html>
