<%@page import="com.ict.trust.vbct.model.StudentWorkBo"%>
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
document.getElementById("stu_work_id").value=id;
document.home.action="edit_work_info.htm";
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
                
                <th>Company</th>
                <th>Date</th>
                <th>Position</th>
                 <th>Company Location</th>
                
               
            </tr>
        </thead>
        <tbody>
      <%List<StudentWorkBo> lst=(List<StudentWorkBo>)request.getAttribute("list");
for(int i=0;i < lst.size();i++)
{ %>
        
           <tr align="center">
              <td><input type="text" id="company<%=lst.get(i).getStu_work_id()%>" name="company<%=lst.get(i).getStu_work_id()%>" value="<%=lst.get(i).getCompany()%>"/></td>
                <td><input type="text" id="start_date<%=lst.get(i).getStu_work_id()%>" name="start_date<%=lst.get(i).getStu_work_id()%>" value="<%=lst.get(i).getStart_date()%>"/></td>
               <td><input type="text" id="position<%=lst.get(i).getStu_work_id()%>" name="position<%=lst.get(i).getStu_work_id()%>" value="<%=lst.get(i).getPosition()%>"/></td>
                <td><input type="text" id="company_location<%=lst.get(i).getStu_work_id()%>" name="company_location<%=lst.get(i).getStu_work_id()%>" value="<%=lst.get(i).getCompany_location()%>"/></td>
                            

              
                
              <td><input type="hidden" id="stu_work_id" name="stu_work_id"></td>
      
                <td> <input type="button" value="Edit" onclick="edit('<%=lst.get(i).getStu_work_id()%>')"/></td>
            </tr>
        
        <%} %>
        </tbody>
    </table>
    </fieldset>
    </div>
    </form:form>
</body>
</html>