$(document).ready(function(){
	$('input[type=file]').bootstrapFileInput();
	$('.file-inputs').bootstrapFileInput();	
	//initialize the datepicker
	$('.datepicker').datepicker();

	//this is for adding the uploaded image preview in step 1
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
	    //$("#body1").collapse('hide');
	    $("#body2").collapse('show');
	    //any js validation would go here:
	    $(".file-input-wrapper").removeClass("btn-primary");
	    $(".file-input-wrapper").addClass("btn-success");
	    $("#title1").html('Step 1 ✓');
	});
/*
***look here***
http://jsfiddle.net/jaredwilli/tZPg4/4/

*/

	//this section is for adding additional FB fields

  // This is the old hacky way
  /*
	var fb_div = $('#fb-fields');
	var i = $('#fb-fields .field').length+1;

	$("#fb-fields").on('click', '.btn-add', function(e){
		e.preventDefault(); //needed to suppress form submit action in rails
		$('<div class="field input-group" id="fb_'+i+'"><input type="text" class="form-control fb_url" id="search_facebook_url_string_'+i+'" name="search[facebook_url_string_'+i+']" placeholder="Facebook URL" /><span class="input-group-btn"><button type="button" class="btn btn-success btn-add">+</button></span></div>').appendTo(fb_div);
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
  */

	//this is the 'get started' button's onClick method
	$('.btn-get-started').click(function(e){
		e.preventDefault();
		$(".bx-loading").remove();
		$(".bx-wrapper").fadeIn();
		$("#steps").fadeIn();
	});

	//this is for the next button
	$('#crawl').click(function(e){
		e.preventDefault();
		//$('#body2').collapse('hide');
		$('#body3').collapse('show');
		$("#crawl").removeClass("btn-primary");
	    $("#crawl").addClass("btn-success");
	    $("#title2").html('Step 2 ✓');
	});

	//this is for the final submit button
    $('.row').submit(function() {
        var str = '';
        $('.fb_url').each(function() {
            str += $(this).val();
            str += ' ';
        });
        $('#facebook_url_string').val(str);
        return true;
    });
});
