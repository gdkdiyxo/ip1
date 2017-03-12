var idfg = 0;

function initMultiUploader(){
	new multiUploader(config);
}

function multiUploader(config){
  
	this.config = config;
	this.items = "";
	this.all = [];
	var self = this;
	
	multiUploader.prototype._init = function(){
		if (window.File && 
			window.FileReader && 
			window.FileList && 
			window.Blob) {
//			 var inputId = $("#"+this.config.form).find("input[type='file']").eq(0).attr("id");
			var inputId = this.config.form;
			 document.getElementById(inputId).addEventListener("change", this._read, false);
			 document.getElementById(this.config.dragArea).addEventListener("dragover", function(e){ e.stopPropagation(); e.preventDefault(); }, false);
			 document.getElementById(this.config.dragArea).addEventListener("drop", this._dropFiles, false);
			 /*document.getElementById(this.config.form1).addEventListener("click",this._submit,false);*/
		} else
			console.log("Browser supports failed");
	}
	
	
	
	multiUploader.prototype._read = function(evt){
		if(evt.target.files){
			self._preview(evt.target.files);
			self.all.push(evt.target.files);
			
		} else 
			console.log("Failed file reading");
	}
	
	multiUploader.prototype._validate = function(format){
		var arr = this.config.support.split(",");
		return arr.indexOf(format);
	};
	
	multiUploader.prototype._dropFiles = function(e){
		e.stopPropagation(); 
		e.preventDefault();
		self._preview(e.dataTransfer.files);
		self.all.push(e.dataTransfer.files);
	};
	
	
	String.prototype._unique = function(){
		return this.replace(/[a-zA-Z]/g, function(c){
     	   return String.fromCharCode((c <= "Z" ? 90 : 122) >= (c = c.charCodeAt(0) + 13) ? c : c - 26);
    	});
	};
	
	multiUploader.prototype._preview = function(data){
		  
		this.items = data;
		if(this.items.length > 0){
			var uId = "";
			var src="";
			
 			for(var i = 0; i<this.items.length; i++){
 				uId = this.items[i].name._unique();
 				var FileExt = this.items[i].name.substr(this.items[i].name.lastIndexOf('.')+1);
 				if(this.items[i].size < 512000 && (FileExt == "jpg" || FileExt == "png" || FileExt == "jpeg")){
	 				 var FR= new FileReader();
	 				 FR.onload = function(e) {
	 				      src = e.target.result;
	 				     umang(src, idfg, uId);
	 				    idfg++;
	 				 }; 
	 				 FR.readAsDataURL(this.items[i]);
 				}else{
 					alert("The file "+this.items[i].name+" is too large or have invalid format. Image must be less than 500Kb and must be a JPG or PNG file  !!!");
 				}
			}
		}
	};
	
	function umang(src, id, uId){
		var sampleIcon = '<img id="'+idfg+'" src="'+src+'"/>';
		var html = '<div class="dfiles" rel="'+uId+'"><h5>&nbsp;&nbsp;'+sampleIcon+' image '+id+'</h5></div>';
		$("#dragAndDropFiles").append(html);
	}
	

	this._init();
}


