function onlyalphabet(inputtxt) 
{
		var letters = /^[A-Za-z]+$/;
		if (inputtxt.value.match(letters))
		{

			return true;
		} else
		{

			
			alert('Please input alphabet characters only & space is not allowed');
			inputtxt.value="";

			return false;
		}
}

function alphanumber(inputtxt) 
{
		var letters = /^[A-Za-z0-9]+$/;
		if (inputtxt.value.match(letters))
		{

			return true;
		} else
		{

			
			alert('Please input alphanumeric values only');
			inputtxt.value="";

			return false;
		}
}


function onlyalphabetwithspace(inputtxt1) 
{
		var letters = /^[A-Za-z ]+$/;
		if (inputtxt1.value.match(letters))
		{

			return true;
		} else
		{
			alert('Please input alphabet characters only');
			inputtxt1.value="";

			return false;
		}
}

function checkFile200kb_pdf(fieldObj)
{
    var FileName  = fieldObj.value;
    var FileExt = FileName.substr(FileName.lastIndexOf('.')+1);
    var FileSize = fieldObj.files[0].size;
    var FileSizeMB = (FileSize/10485760).toFixed(2);

    if ( FileExt == "pdf" && FileSize<204800 || FileExt == "doc" && FileSize<204800 || FileExt == "docx" && FileSize<204800)
    {
    	 return true;
    }
    else
    {
    	
         var error = "Please make sure your file is in pdf,doc or docx format and less than 200 KB.";
         alert(error);
        document.getElementById("birth").value="";
       
        return false;
    }     
}

function checkFile1MB_pdf(fieldObj)
{
    var FileName  = fieldObj.value;
    var FileExt = FileName.substr(FileName.lastIndexOf('.')+1);
    var FileSize = fieldObj.files[0].size;
    var FileSizeMB = (FileSize/10485760).toFixed(2);

    if ( FileExt == "pdf" && FileSize<1024000 || FileExt == "doc" && FileSize<1024000 || FileExt == "docx" && FileSize<1024000 ||
    		FileExt == "PDF" && FileSize<1024000 || FileExt == "DOC" && FileSize<1024000 || FileExt == "DOCX" && FileSize<1024000)
    {
    	 return true;
    }
    else
    {
    	
         var error = "Please make sure your file is in pdf,doc or docx format and less than 1 MB.";
         alert(error);
         fieldObj.value="";
       
        return false;
    }     
}

function checkFile5MB_pdf(fieldObj)
{
    var FileName  = fieldObj.value;
    var FileExt = FileName.substr(FileName.lastIndexOf('.')+1);
    var FileSize = fieldObj.files[0].size;
    var FileSizeMB = (FileSize/10485760).toFixed(2);

    if ( FileExt == "pdf" && FileSize<5120000 || FileExt == "doc" && FileSize<5120000 || FileExt == "docx" && FileSize<5120000)
    {
    	 return true;
    }
    else
    {
    	
         var error = "Please make sure your file is in pdf,doc or docx format and less than 5 MB.";
         alert(error);
         fieldObj.value="";
       
        return false;
    }     
}

function yearlength(form1) {
	var len = form1.value.length;
	if (len < 4) {
		alert("Please enter a valid Year with minimum 4 digits!!");
		form1.value = "";
		form1.focus();
		return false;
	}

	onlynumbers(form1);
}


function percentageformat(num)
{	
	var re = /^((0|[1-9]\d?)(\.\d{1,2})?|100(\.00?)?)$/;

	if(num.value.match(re))
		{
			return true;
		}
	else
		{ 
			alert("Please enter percentage in correct format");
			num.value="";
			num.focus();
			return false;
		}
	
	
}

function  aplhaspecial(inputtxt)
{
	 var ck_alphaspec = /^[A-Za-z!$.^&*()_ ]{1,200}$/;
		if (inputtxt.value.match(ck_alphaspec))
		 {

			return true;
		} 
		else 
		{

			
			alert('Please enter alphabet characters only');
			inputtxt.value="";

			return false;
		}
}

function  validateaddress(inputtxta)
{
	 var ck_alphaspec = /^[A-Za-z0-9!-$.\,\-\/^&*()_ ]{1,150}$/;
		if (inputtxta.value.match(ck_alphaspec))
		 {

			return true;
		} 
		else 
		{

			
			alert('Please enter valid values');
			inputtxta.value="";

			return false;
		}
}


function checkfuturedate(form)
{
	
	var monthfield = form.value.split("/")[0];
	var dayfield = form.value.split("/")[1];
	var yearfield = form.value.split("/")[2];
	var tmpdate = dayfield + "/" + monthfield + "/" + yearfield;
	var myDate = new Date(tmpdate);
	var today = new Date();
	if (myDate > today) {
		alert("You cannot enter future date.");
		form.value = "";
		form.focus();
		return true;
	} else {
		return false;
	}

}

function checkfuturemonth(form)
{
	var dayfield = '01';
	var monthfield = form.value.split("/")[0];
	var yearfield = form.value.split("/")[1];
	var tmpdate = monthfield + "/" + dayfield + "/" + yearfield;
	var myDate = new Date(tmpdate);
	var today = new Date();
	if (myDate > today) {
		alert("You cannot enter future date.");
		form.value = "";
		form.focus();
		return true;
	} else {
		return false;
	}

}

function checkpastdate(form)
{
	
	var monthfield = form.value.split("/")[0];
	var dayfield = form.value.split("/")[1];
	var yearfield = form.value.split("/")[2];
	var tmpdate = dayfield + "/" + monthfield + "/" + yearfield;
	var myDate = new Date(tmpdate);
	var today = new Date();
	if (myDate < today) {
		alert("You cannot enter past date.");
		form.value = "";
		form.focus();
		return true;
	} else {
		return false;
	}

}

function allowtodayfututre(val) 
{
	
	var form = val;
	var monthfield = form.value.split("/")[0];
	var dayfield = form.value.split("/")[1];
	var yearfield = form.value.split("/")[2];
	var tmpdate = dayfield + "/" + monthfield + "/" + yearfield;
// 	alert(tmpdate);
	var myDate = new Date(tmpdate);
	var today = new Date();

	var todaydate=today.getDate();
	var todaymonth=today.getMonth();
	var todayyear=today.getFullYear();


	var todaydate1=myDate.getDate();
	var todaymonth1=myDate.getMonth();
	var todayyear1=myDate.getFullYear();
	
// 	alert("today only date---->>>>>"+todaydate+"/"+todaymonth+"/"+todayyear); 	
	var finaltoday=todaydate+"/"+todaymonth+"/"+todayyear;
	var finalmyDate=todaydate1+"/"+todaymonth1+"/"+todayyear1;
// 	alert("Mydate is-->"+myDate);
// 	alert("today is-->"+finaltoday);
	
	if (myDate > today || finalmyDate==finaltoday)
	{
		return true;
	}
	else
    {
		alert("You cannot enter past date.");
		form.value = "";
		return false;
	}

}

function ddmmyyyycheck(text)
{
	var dateformat = /^(0[1-9]|[12][0-9]|3[01])[\- \/.](?:(0[1-9]|1[012])[\- \/.](19|20)[0-9]{2})$/;
		if(text.value.match(dateformat))
			{
				return true;
			}
		else
			{
				alert("Please enter Date in correct format");
				text.value="";
				
			}	
	}

function mmyyyycheck(text)
{
	var dateformat = /^([0-9]{2})\/([0-9]{4})$/;
		if(text.value.match(dateformat))
			{
				return true;
			}
		else
			{
				alert("Please enter Date in correct format");
				text.value="";
				
			}	
	}

function ddmmyyyycheckReceipt(text)
{
	var dateformat = /^([0-9]{2})\/([0-9]{2})\/([0-9]{4})$/;
		if(text.value.match(dateformat))
			{
				return true;
			}
		else
			{
				alert("Please enter Date in correct format");
				text.value="";
				
			}	
	}

function checkFile_img(fieldObj)
{
    var FileName  = fieldObj.value;
    var FileExt = FileName.substr(FileName.lastIndexOf('.')+1);
    var FileSize = fieldObj.files[0].size;
    var FileSizeMB = (FileSize/10485760).toFixed(2);

    if ( FileExt == "jpg" && FileSize<51200 || FileExt == "jpeg" && FileSize<51200)
    {
    	 return true;
    }
    else
    {
    	/* var error = "File type : "+ FileExt+"\n\n";
        error += "Size: " + FileSizeMB + " MB \n\n";
        error += "Please make sure your file is in pdf or doc format and less than 50KB.\n\n";
         */
         var error = "Please make sure your photo is in JPEG/JPG format and less than 50KB.";
         alert(error);
         fieldObj.value="";
       
        return false;
    }     
}

function checkFile300kb_img(fieldObj)
{
    var FileName  = fieldObj.value;
    var FileExt = FileName.substr(FileName.lastIndexOf('.')+1);
    var FileSize = fieldObj.files[0].size;
    var FileSizeMB = (FileSize/10485760).toFixed(2);

    if ( FileExt == "jpg" && FileSize<307200 || FileExt == "jpeg" && FileSize<307200 || FileExt == "png" && FileSize<307200 || FileExt == "gif" && FileSize<307200)
    {
    	 return true;
    }
    else
    {
    	
         var error = "Please make sure your file is in JPEG/JPG/PNG/GIF format and less than 300 KB.";
         alert(error);
         fieldObj.value="";
       
        return false;
    }     
}

function check24hour(form3)
{   
				   // regular expression to match required time format
				   re = /^(\d{1,2}):(\d{2})([ap]m)?$/;
					if(form3.value != '' && !form3.value.match(re)) {
				     alert("Invalid time format: " + form3.value);
				     form3.value="";
				     form3.focus();
				     return false;
				   }
				   if(form3.value != '') 
					{
				     if(regs = form3.value.match(re))
					  {
				      
				      // 24-hour value between 0 and 23
				         if(regs[1] < 0 || regs[1] > 23)
					      {
				           alert("Invalid value for hours: " + regs[1]);
				           form3.value="";
				           form3.focus();
				           return false;
				         }
				       }
				       // minute value between 0 and 59
				       if(regs[2] > 59)
					    {
				         alert("Invalid value for minutes: " + regs[2]);
				         form3.value="";
				         form3.focus();
				         return false;
				       }
				     } 
				     else
					  {
				       alert("Invalid time format: " + form3.value);
				       form3.value="";
				       form3.focus();
				       return false;
				     }
				   return true;
}

function onlynumbers(form) {
	if (isNaN(form.value)) {
		alert('Please Enter Numeric Values Only');
		form.focus();
		form.value="";
		return false();
	} else
		return true;
}

function pinValidation(pin) {
	var val = pin.value;
	if (/^\d{6}$/.test(val)) {
		// value is ok, use it
	} else {
		alert("Please enter valid pincode");
		pin.value = "";
		pin.focus();
		return false;
	}
}
function mobileValidation(mble) {
	 var val = mble.value;
	if (/^[0-9]{10,10}$/.test(val)) {
		return true;
	} else {
		alert("Please enter valid mobile no");
		mble.value = "";
		mble.focus();
		return false;
	} 
}
function validateEmail(txtinput)
{
	var ck_email = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([A-Za-z]{2,6}(?:\.[a-z]{2})?)$/;
	{
		if (!txtinput.value == "") {
			if (txtinput.value.match(ck_email)) {

				return true;
			} else {
				txtinput.value = "";
				txtinput.focus();
				alert('Please Enter Valid Email ');
				return false;
			}
		}
	}
}

function  telephone(inputtxt) {
	var ck_spcl= /^[0-9]{7,15}$/;
	if (inputtxt.value.match(ck_spcl)) {

		return true;
	} else {

		
		alert('Please input correct number');
		inputtxt.value="";

		return false;
	}
}