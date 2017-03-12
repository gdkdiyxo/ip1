<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript">
function saveAddAlbum()
{
	var flag = true;
	if(document.getElementById("albumName").value == "")
	{
		document.getElementById("albumName1").style.display = "block";
		flag = false;
	}
	if(document.getElementById("album_image").value == "")
	{
		document.getElementById("album_image1").style.display = "block";
		flag = false;
	}
	if(flag)
	{
		document.adminform.action = "saveAddAlbum.htm";
		document.adminform.submit();
	}
}
</script>
</head>
<body>
<h1 align="center">Add Album</h1><br>
<div class="formdesign">
		<h4 style="margin: 5px 2px;color: #961200;" align="center">Album details</h4><table width="100%">
		<tbody><tr>
				<td ><b>Album Name: <span style="font-size: 15px; color: red;">*</span>	</b></td>
				<td><input type="text" name="album_name" id="albumName" onclick="Hide(this);" onchange="Hide(this);">
				<span style="display: none;color: red;font-size: 12px;" id="albumName1">You can't leave this empty</span>
				</td>
				<td ><b>Album Title Image : </b></td>
				<td><input type="file" name="album_image" id="album_image" onclick="Hide(this);" onchange="checkFile300kb_img(this);Hide(this);">
				<span style="display: none;color: red;font-size: 12px;" id="album_image1">You can't leave this empty</span>
				<input type="hidden" name="album_title_img" id="hidepic"/></td>
				
				</tr>
		
		</tbody></table>
		<br>
		</div>
		<br>
		<div align="center">
		<input value="Submit" onclick="saveAddAlbum();" type="button">
		<input value="Reset" style="margin-left: 5px" type="reset">
		</div>
</body>
<script>

  function convert(evt) {
    var files = evt.target.files;

    for (var i = 0, f; f = files[i]; i++) {

      if (!f.type.match('image.*')) {
        continue;
      }

      var reader = new FileReader();

      reader.onload = (function(theFile) {
        return function(e) 
        {          
        	 document.getElementById('hidepic').value=""; 
			document.getElementById('hidepic').value=e.target.result;
			
	    };
      })(f);
      reader.readAsDataURL(f);
    }
  }
  	
  	document.getElementById('album_image').addEventListener('change',convert, false);
</script>

</html>