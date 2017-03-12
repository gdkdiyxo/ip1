<div class="maindiv" style="background: transparent linear-gradient(rgb(204, 136, 127) 35%, rgb(247, 196, 151) 37%, rgb(217, 164, 158) 81%) repeat scroll 0% 0%; border-bottom: 3px solid rgb(150, 18, 0);" >
<table style="height: 115px;background-image: url('<%=request.getContextPath()%>/img/contactus_TopBanner1.png');"
				border="0" class="position">
				<tr>
					<td style="width: 105px;" rowspan="2">
					<img src="<%=request.getContextPath()%>/img/logoo.png" alt="Logo of VBCT"
						draggable="false" style="width: 123px">
					</td>
					<td align="center">
					<span class="headtitle">Shree Vraj Bhagirathi Charitable Trust </span>
					</td>
					<td style="width: 105px;" rowspan="2" align="right">
					<img src="<%=request.getContextPath()%>/img/2.JPG" alt="asd"
						draggable="false" style="width: 100px; height: 108px"></td>
				</tr>
				<tr>
					<td align="right" style="height: 20px;">
					<%if(null!=session.getAttribute("admin")){%>
					<strong	class="" >
						<%out.print("Welcome, "+session.getAttribute("admin")); }%>
					</strong>
					
					</td>
				</tr>
			</table>
</div>