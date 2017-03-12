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
document.getElementById("stu_edu_id").value=id;
document.home.action="edit_education_info.htm";
document.home.submit();
}
</script>
</head>
<body>

<form:form modelAttribute="EditEdu" >
<fieldset>
<h1 align="center">Education</h1>
<table id="example" class="display">
        <thead>
            <tr align="center">
                <th>University</th>
                 <th>Degree</th>
                 <th>Major</th>
                <th>Student Gpa</th>
                <th>University location</th>
                 <th>Action</th>
            </tr>
        </thead>
        <tbody>
      <%List<StudentEducationBo> lst=(List<StudentEducationBo>)request.getAttribute("list");
for(int i=0;i < lst.size();i++)
{ %>
           <tr align="center">
              <td><input type="text" id="university<%=lst.get(i).getStu_edu_id()%>" name="university<%=lst.get(i).getStu_edu_id()%>" value="<%=lst.get(i).getUniversity()%>"/></td>
                            <td><input width="10px" type="text" id="degree_type<%=lst.get(i).getStu_edu_id()%>" name="degree_type<%=lst.get(i).getStu_edu_id()%>" value="<%=lst.get(i).getDegree_type()%>"/></td>
                            <td><input type="text" id="major<%=lst.get(i).getStu_edu_id()%>" name="major<%=lst.get(i).getStu_edu_id()%>" value="<%=lst.get(i).getMajor()%>"/></td>
                            <td><input type="text" id="degree_gpa<%=lst.get(i).getStu_edu_id()%>" name="degree_gpa<%=lst.get(i).getStu_edu_id()%>" value="<%=lst.get(i).getDegree_gpa()%>"/></td>
                            <td><input type="text" id="university_location<%=lst.get(i).getStu_edu_id()%>" name="university_location<%=lst.get(i).getStu_edu_id()%>" value="<%=lst.get(i).getUniversity_location()%>"/></td>
                <td><input type="hidden" id="stu_edu_id" name="stu_edu_id"> <input type="button" value="Edit" onclick="edit('<%=lst.get(i).getStu_edu_id()%>')"/></td>
            </tr>
        <%} %>
        </tbody>
    </table>
    </fieldset>
    </form:form>
</body>
</html>