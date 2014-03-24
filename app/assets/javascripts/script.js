$(document).ready(function(){
	$('input[type=file]').bootstrapFileInput();
	$('.file-inputs').bootstrapFileInput();	
	$('.datepicker').datepicker();

	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        
	        reader.onload = function (e) {
	            $('#img-preview').attr('src', e.target.result);
	        }
	        
	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$("#imgInp").change(function(){
	    readURL(this);
	    $("#img-preview").css("opacity", 1);
	});
});


