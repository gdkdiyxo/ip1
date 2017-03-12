<%@page import="com.ict.trust.vbct.model.Login"%>
<%@page import="java.util.HashMap"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/img/sm.jpg" type="image/x-icon">
<html>
<%@include file="adminhead.jsp" %>
<body>
<%@include file="adminheader.jsp" %>
<form:form name="adminform" enctype="multipart/form-data">
	<div class="maindiv">
		<table class="position" style="height: 500px" border="0">
			<tr>
				<td style="width: 190px;vertical-align: top;border-right: 1px solid lightgray;">
					<%@include file="adminleftmenu.jsp" %>
				</td>
				<td style="vertical-align: top">
				<div class="maindiv"><!-- content div -->

				<% if(null != request.getAttribute("adminfilename")){ %>
				<%String filename=request.getAttribute("adminfilename") + ".jsp";%>
				 <jsp:include page="<%=filename%>" /> 
				 <%} %>
				</div>
				<%if(request.getAttribute("success")!=null){
	String success = (String)request.getAttribute("success");
%>					<div align="center" class="sucmain" id="sucuc">
						<div id="mydiv" name="mydiv" class="successBlk" align="center">
						<b>
						<img src="<%=request.getContextPath()%>/images/success.png" style="width: 18px;"/>
								<%=success%>
						</b><span style="float: right;margin-right: 8px;cursor: pointer;"><a onclick="disNone('sucuc');" style="color: black;font-weight: 600;">X</a></span>
					</div></div>
<%} %>
<%if(request.getAttribute("error")!=null){
	String error = (String)request.getAttribute("error");
%>					
				<div align="center" class="errmain" id="ererdd">
						<div id="mydiv" name="mydiv" class="errorBlk" align="center">
						<b>
						<img src="<%=request.getContextPath()%>/images/error.png" style="width: 15px"/>
								<%=error%>
						</b><span style="float: right;margin-right: 8px;cursor: pointer;"><a onclick="disNone('ererdd');" style="color: black;font-weight: 600;">X</a></span>
					</div></div>
<%} %>
				</td>
			</tr>
		</table>
	</div>
	<%@include file="adminfooter.jsp" %>
</form:form>
</body>
<script type="text/javascript">
	function disNone(divb){
			document.getElementById(divb).style.display = 'none';
		}
</script>
</html>