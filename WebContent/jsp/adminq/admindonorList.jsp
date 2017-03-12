<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.ict.trust.vbct.model.DonationBO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Donor List</title>
<style type="text/css">
.black_overlay{
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index:1001;
	-moz-opacity: 0.8;
	opacity:.80;
	filter: alpha(opacity=80);
}

.white_content {
	display: none;
	position: absolute;
	top: 18%;
	left: 29%;
	width: 51%;
	height: 65%;
	padding: 16px;
	border: 4px groove brown;
	background-color: white;
	z-index:1002;
	overflow: auto;
}
</style>

<style type="text/css">
input.button_css:hover
{

    text-decoration: underline;
    
}
.pg-selected
{
color:brown !important;
	font-size: 20px;
	text-decoration: underline;
	font-weight: bold;
	
}
</style>
<script type="text/javascript">  
function Pager(tableName, itemsPerPage) {
    this.tableName = tableName;  
    this.itemsPerPage = itemsPerPage;  
    this.currentPage = 1;  
    this.pages = 0;  
    this.inited = false;  
      
    this.showRecords = function(from, to) {          
        var rows = document.getElementById(tableName).rows;  
        // i starts from 1 to skip table header row  
        for (var i = 1; i < rows.length; i++) {  
            if (i < from || i > to)    
                rows[i].style.display = 'none';  
            else  
                rows[i].style.display = '';  
        }  
    }  
      
    this.showPage = function(pageNumber) {  
     if (! this.inited) {  
      alert("not inited");  
      return;  
     }  
  
        var oldPageAnchor = document.getElementById('pg'+this.currentPage);  
        oldPageAnchor.className = 'pg-normal';  
          
        this.currentPage = pageNumber;  
        var newPageAnchor = document.getElementById('pg'+this.currentPage);  
        newPageAnchor.className = 'pg-selected';  
          
        var from = (pageNumber - 1) * itemsPerPage + 1;  
        var to = from + itemsPerPage - 1;  
        this.showRecords(from, to);  
    }     
      
    this.prev = function() {  
        if (this.currentPage > 1)  
            this.showPage(this.currentPage - 1);  
    }  
      
    this.next = function() {  
        if (this.currentPage < this.pages) {  
            this.showPage(this.currentPage + 1);  
        }  
    }                          
      
    this.init = function() {  
        var rows = document.getElementById(tableName).rows;  
        var records = (rows.length - 1);   
        this.pages = Math.ceil(records / itemsPerPage);  
        this.inited = true;  
    }  
  
    this.showPageNav = function(pagerName, positionId) {  
     if (! this.inited) {  
      alert("not inited");  
      return;  
     }  
     var element = document.getElementById(positionId);  
       
     var pagerHtml = '<span onclick="' + pagerName + '.prev();" style="cursor: pointer;background-color: #FFF;color: #000;font-size: 17px;" class="pg-normal"> « Previous </span> &nbsp; ';  
        for (var page = 1; page <= this.pages; page++)   
            pagerHtml += '<span id="pg' + page + '" style="cursor: pointer;color: #000;"  onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span>&nbsp;  ';  
        pagerHtml += '&nbsp;<span onclick="'+pagerName+'.next();" style="cursor: pointer;background-color: #FFF;color: #000;font-size: 17px;" > Next »</span>';              
          
        element.innerHTML = pagerHtml;  
    }; 
}  
</script>  

</head>

<body>
<input type="hidden" id="hideid" name="hideid"/>
<h1 align="center">Search Donor</h1>

<table width="100%">
<tr>
	<td> Full Name : </td>
	<td> <input type="text" name="name" id="name" <% if(null != request.getAttribute("name")){ %>value="<%= (String) request.getAttribute("name") %>"<%} %> /> </td>
	<% String purpose = null; 
	if(null != request.getAttribute("purpose")){
		purpose = (String) request.getAttribute("purpose");
		System.out.println(purpose);
	}	
	%>
	
	<td> Purpose of Donation :</td>
	<td> <select onclick="hideDiv(this.name);" id="donation_purpose"
					name="purpose">
						<option value="Select">--Select--</option>
						<option <%if(null != purpose && purpose.equalsIgnoreCase("Devka school")){ %> selected="selected" <%} %> value="Devka school">Devka school</option>
						<option <%if(null != purpose && purpose.equalsIgnoreCase("Devka college")){ %> selected="selected" <%} %> value="Devka college">Devka college</option>
						<option <%if(null != purpose && purpose.equalsIgnoreCase("Gau shalla")){ %> selected="selected" <%} %> value="Gau shalla">Gau shalla</option>
						<option <%if(null != purpose && purpose.equalsIgnoreCase("Other")){ %> selected="selected" <%} %> value="Other">Other</option>
				</select>
			</td>
</tr>
<tr>
	<td align="left">Country :</td>
	<td><select id="country" name="country" style="margin-top: 5px">
		<option value="Select">--Select--</option>
		<c:forEach var="lst" items="${requestScope.list}">
			<option id="${lst.country_std_code}"  value="${lst.country_name}">${lst.country_name} (${lst.country_std_code})</option>
		</c:forEach>
	</select>
	</td>
	
	<td> Donation Year :</td>
	<td> <%-- <input <% if(null != request.getAttribute("year")){ %> 
	value="<%= (String) request.getAttribute("year") %>"<%} %> type="text" name="year" id="year"/>  --%>
	<c:set var="yrr" value="${requestScope.year}"/>
	<select name="year" id="year">
	<option value="">--Select--</option>
	<%if(null!=request.getAttribute("treeYMap")){
	TreeMap<String,String> treeYMap=(TreeMap<String,String>)request.getAttribute("treeYMap");
	Set set = treeYMap.entrySet();
	java.util.Iterator iterator = set.iterator();
		      while(iterator.hasNext()) {
		         Map.Entry mentry = (Map.Entry)iterator.next();%>
		         <c:set var="thyr" value="<%=mentry.getKey()%>"/>
		<option value="<%=mentry.getKey()%>" <c:if test="${yrr==thyr}"> selected="selected" </c:if>  ><%=mentry.getKey()%></option>
		
		<%} }%>
		</select>
	
	</td>
</tr>
<tr>
	<td colspan="4" align="center"> <input type="button" value="Search" onclick="search();"/> <input type="reset" value="Reset"/> </td>
</tr>
</table>
<br/>

<div id="maintab">
	<h1 align="center">Donor List</h1>
	<table width="100%" border="0" id="don" class="vbcttbl">
		<tr style="">
			<th>Name</th>
			<th>Country</th>
			<th>Donation Purpose</th>
			<th>Amount (<label class="rupees"><img src="<%=request.getContextPath()%>/img/rupee.png" style="width: 12px;"/></label>)</th>
			<th>Delete</th>
			<th>Show/hide</th>
		</tr>
	<tbody id="tabBody">
	<c:forEach var="donorlist" items="${requestScope.donorlst}">
		<tr>
			<td align="center"><u><a style="cursor: pointer;color: blue;" onclick="document.getElementById('${donorlist.donor_id}').style.display='block';document.getElementById('fade').style.display='block'">${donorlist.donor_name} </a></u></td>
			<td>${donorlist.country}</td>
			<td>${donorlist.donation_purpose}</td>
			<td>${donorlist.donation_amount}</td>
			<td align="center">
			    <a title="Delete" style="cursor: pointer;" onclick="del('${donorlist.donor_id}')"><img src="<%= request.getContextPath() %>/images/error.png"/></a>
			</td>
			<td align="center"> 
			<c:choose>
			    <c:when test="${donorlist.status == 'Y'}">
			    	<span class="tooltip" onmouseover="tooltip.pop(this, 'This button hides balance<br> sheet from homepage')">
			       <input class="smBtnWhite" style="width: 100px;" type="button" value="Hide" onclick="hide('${donorlist.donor_id}',this.value)"/>
			       </span>
			    </c:when>
			    <c:otherwise>
			    <span class="tooltip" onmouseover="tooltip.pop(this, 'This button shows balance<br> sheet on homepage')">
			   <input class="smBtnRed" style="width: 100px;" type="button" value="Show" onclick="hide('${donorlist.donor_id}',this.value)"/>
			   </span>
			    </c:otherwise>
			</c:choose>
			
			</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	<br/>
	<div id="pageNavPosition" align="center" style="background-color: white;color: white;padding-bottom: 5px"></div> 
	
<c:forEach var="donorlist1" items="${requestScope.donorlst}">
<div id="${donorlist1.donor_id}" class="white_content">
<div align="right"><a style="cursor: pointer;font-weight: bold; color: red;" onclick="document.getElementById('${donorlist1.donor_id}').style.display='none';document.getElementById('fade').style.display='none'">X</a></div>
<div class="formdesign">
<div><h4 align="center" style="margin: 5px 2px;color: #961200;">Personal details</h4></div>
<table align="center" width="100%">
	<tr>
		<td align="left"><b>Full Name : </b></td>
		<td>
			<div class="ui-widget">
			<input readonly="readonly" value="${donorlist1.donor_name}"  type="text" name="donor_name" id="donor_name">
			</div>
		</td>
		<td align="left"><b>Country : </b></td>
		<td> <input value="${donorlist1.country}" readonly="readonly"  type="text" name="donor_name" id="donor_name">	</td>
	</tr>
	<tr>
		<td align="left"><b>Mobile Number : 	</b></td>
		<td><input value="${donorlist1.mobile_number}" readonly="readonly"  type="text" name="donor_name" id="donor_name">	</td>
		
		<td align="left"><b>Email-ID : 	</b></td>
		<td><input value="${donorlist1.email}" readonly="readonly"/></td>
	</tr>
	<tr >
		<td align="left"><b>Address :</b></td>
		<td><textarea name="address" id="address" readonly="readonly">${donorlist1.address }</textarea></td>	
		<td></td>
	</tr>
</table><br/></div><br/>
		<div class="formdesign">
		<h4 align="center" style="margin: 5px 2px;color: #961200;">Donation details</h4><table width="100%">
		<tr>
			<td align="left"><b>Receipt number : </b></td>
			<td><input value="${donorlist1.receipt_no }" readonly="readonly"  type="text" name="receipt_no" id="receipt_no"></td>
			
			<td align="left"><b>Receipt Date :</b></td>
			<td><input value="${donorlist1.receipt_dt }" readonly="readonly"  type="text" name="receipt_dt" id="receipt_dt" style="height: 26px; width: 180px;"></td>
				
			</tr><tr><td colspan="4"></td></tr>
		<tr style="margin-top: 15px;">
			<td align="left"><b>Purspose Of Donation :</b></td>
			<td><input value="${donorlist1.donation_purpose}" type="text" readonly="readonly"/></td>
			
			<td align="left"><b>Contribution Mode :</b></td>
				<td><input value="${donorlist1.pay_mode}" type="text" readonly="readonly"/></td>
				<td align="left"></td>
			</tr>
			<tr>
			<td align="left" ><b>Amount of Donation : 
						</b></td>
				<td><label class="rupees">&#8377;</label> <input value="${donorlist1.donation_amount}" readonly="readonly"  type="text"
					 style="width: 164px" />
					</td>
			<td align="left"><b>Remarks :</b></td>
				<td><textarea readonly="readonly" name="remarks" id="remarks">${donorlist1.remarks }</textarea></td>	
			</tr></table><br/></div>


</div>
</c:forEach>
        
<div id="fade" class="black_overlay"></div>
		<script type="text/javascript">
        var pager = new Pager('don',10);   
        pager.init();   
        pager.showPageNav('pager', 'pageNavPosition');   
        pager.showPage(1);
    </script> 
</div>
<br/>

</body>
</html>