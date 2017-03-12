<%@page import="com.ict.trust.vbct.model.StudentCertificateBo"%>
<%@page import="com.ict.trust.vbct.model.StudentEducationBo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function edit(id)
{
document.getElementById("certificate_id").value=id;
document.home.action="edit_certi_info.htm";
document.home.submit();
}
</script>
</head>
<body>

<form:form modelAttribute="EditCerti" >
<div id="pdfdiv" style="width=80px;">
<fieldset>
<h1 align="center">Certification</h1>
<table id="example" class="display" cellspacing="0" width="5px" border="0">

        <thead>
            <tr align="center">
                
                <th>Title</th>
                 <th>Certificate Body</th>
                 
                
               
            </tr>
        </thead>
        <tbody>
      <%List<StudentCertificateBo> lst=(List<StudentCertificateBo>)request.getAttribute("list");
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr align="center">
              <td><input type="text" id="certificate_title<%=lst.get(i).getCertificate_id()%>" name="certificate_title<%=lst.get(i).getCertificate_id()%>" value="<%=lst.get(i).getCertificate_title()%>"/></td>
               <td><input type="text" id="certificate_body<%=lst.get(i).getCertificate_id()%>" name="certificate_body<%=lst.get(i).getCertificate_id()%>" value="<%=lst.get(i).getCertificate_body()%>"/></td>
                            

              
                
              <td><input type="hidden" id="certificate_id" name="certificate_id"></td>
      
                <td> <input type="button" value="Edit" onclick="edit('<%=lst.get(i).getCertificate_id()%>')"/></td>
            </tr>
        
        <%} %>
        </tbody>
    </table>
    </fieldset>
    </div>
    </form:form>
</body>
</html>