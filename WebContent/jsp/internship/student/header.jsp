<div class="maindiv" style="background: transparent linear-gradient(rgb(204, 136, 127) 35%, rgb(247, 196, 151) 37%, rgb(217, 164, 158) 81%) repeat scroll 0% 0%; border-bottom: 3px solid rgb(150, 18, 0);" >
			<table border="0" class="position">
				<tr>
	
					</td>
					<td align="center">
					<span class="headtitle">Internship Management System</span>
					</td>
					
				</tr>
				<tr>
					<td align="right" style="height: 20px;">
					
					<%if(null!=session.getAttribute("student")){%>
						<%out.print("<strong>Welcome, "+session.getAttribute("student")+"</strong>"); }else{%>
						<strong	class="forlogin" >
						<a href="#" style="color: #961200; padding: 0px 14px 5px 14px;"
							onclick="loadlogin();">Login</a></strong>
						<%} %>
					
					</td>
				</tr>
			</table>
		</div>