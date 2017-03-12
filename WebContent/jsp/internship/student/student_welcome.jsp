<!doctype html>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<head>
  <meta charset="utf-8">
  <title>IMS</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  

</head>
<%@include file="head.jsp" %>
<body>
 <form:form name="home">
<%@ include file="header.jsp" %>
		<div class="maindiv">
			<table class="position" style="height: 500px" border="0">
				<tr>
					<td
						style="width: 190px; vertical-align: top; border-right: 1px solid lightgray;">
						<%@include file="leftmenu.jsp"%>
					</td>
					<td style="vertical-align: top; padding: 2px 5px 5px 10px;">
	<div class="maindiv"><!-- content div -->

				<% if(null != request.getAttribute("filename")){ %>
				<%String filename=request.getAttribute("filename") + ".jsp";%>
				 <jsp:include page="<%=filename%>" /> 
				 <%} %>
				</div>
				</td>
				</tr>
				</table>
				</div>
				
		<%@include file="footer.jsp" %>
		
</form:form>
 
</body>
</html>