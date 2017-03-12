<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="com.ict.trust.vbct.utility.CommonUtility"%>
<div class="maindiv" style="background:#DDB2AB linear-gradient(#FFF 2%, #F0C2AB 6%, #D3978F 47%) repeat scroll 0% 0%">
<table class="position" border="0" style="height: 30px"> 
<tr>
<td>
<span>Terms & Conditions </span>
|<span style="margin-left: 10px">Privacy Policy</span>
<!-- |<span style="margin-left: 10px">© Copyright 2015</span> -->
</td>
<td style="width: 125px">
<div style="" class="unselectable">
<font style="padding-bottom: 15px;vertical-align: middle;" >© Copyright 2016</font>
</div>
</td>
</tr>
</table>
</div>

<%if(CommonUtility.jasper_Path == null){
	String filepath=  request.getSession().getServletContext().getRealPath("/")+"jasper\\";
	Path path = Paths.get(filepath);
	if(path.getName(1).toString().equals(".metadata")){
		String filePath1 = path.getRoot()+""+path.getName(0)+"";
		String filePath2 =filePath1 + "\\VBCT\\WebContent\\jasper\\";
		CommonUtility.jasper_Path = filePath2;
	}
	else{
	CommonUtility .jasper_Path = filepath;
	}
	System.out.println("Jasper File Path Set ###### >>>>>>>>>"+filepath);
	} %>