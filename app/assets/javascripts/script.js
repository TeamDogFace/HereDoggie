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
/*
***look here***
http://jsfiddle.net/jaredwilli/tZPg4/4/

*/
	var fb_div = $('#fb-fields');
	var i = $('#fb-fields .field').length+1;


	$("#fb-fields").on('click', '.btn-add', function(e){
		e.preventDefault(); //needed to suppress form submit action in rails
		//var value = $('#search_facebook_url_string_'+(i-1)).val();
		//alert("value (in "+(i-1)+"): " + value);
		//alert("value: "+value+" i: " +i);
		$('<div class="field input-group" id="fb_'+i+'"><input type="text" class="form-control" id="search_facebook_url_string_'+i+'" name="search[facebook_url_string_'+i+']" placeholder="Facebook URL" /><span class="input-group-btn"><button type="button" class="btn btn-success btn-add">+</button></span></div>').appendTo(fb_div);
    	//$('#search_facebook_url_string_'+i).val(value);
    	//$('#search_facebook_url_string_'+(i-1)).val('');
    	$(this).text('-');
    	$(this).addClass('btn-remove');
    	$(this).addClass('btn-danger');
    	$(this).removeClass('btn-add');
    	$(this).removeClass('btn-success');
    	$('#search_facebook_url_string_'+i).focus();
    	i++;
	});

	$("#fb-fields").on('click', '.btn-remove', function(e){
		e.preventDefault(); //needed to suppress form submit action in rails
		//$(this).closest('.field').css('background-color', 'red');
    	if( i > 2 ) {
    		$(this).closest('.field').remove();
    		i--;
    	}
	});
});
