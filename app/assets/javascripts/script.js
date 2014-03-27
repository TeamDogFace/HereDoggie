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
	var next = 1;
    $(".add-more").click(function(e){
        e.preventDefault();
        var addto = "#fb" + next;
        var addRemove = "#fb" + (next);
        next = next + 1;
        var newIn = '<input type="text" class="form-control" id="search_facebook_url_string_' + next + '" name="search[facebook_url_string_' + next + ']" placeholder="Facebook URL">';
        var newInput = $(newIn);
        var removeBtn = '<button id="remove' + (next - 1) + '" class="btn btn-danger remove-me" >-</button></div><div id="fb">';
        var removeButton = $(removeBtn);
        $(addto).after(newInput);
        $(addRemove).after(removeButton);
        $("#field" + next).attr('data-source',$(addto).attr('data-source'));
        $("#count").val(next);  
        
            $('.remove-me').click(function(e){
                e.preventDefault();
                var fieldNum = this.id.charAt(this.id.length-1);
                var fieldID = "#fb" + fieldNum;
                $(this).remove();
                $(fieldID).remove();
            });
    });
add this:
		<div class="fb-field input-group" id="fb_#">
            <input type="text" class="form-control" id="search_facebook_url_string_#" name="search[facebook_url_string_1]" placeholder="Facebook URL" />
            <span class="input-group-btn"><button class="btn btn-success btn-add">+</button></span>
        </div>

*/

	var next = 1;
	$(".btn-add").click(function(e){
		e.preventDefault();
		alert("fb_"+next);
		$("fb_" + next).after(makeFB(next+1));
		next = next + 1;

	});


});


function makeFB(number){
	var result = '<div class="fb-field input-group" id="fb_' + number + '"><input type="text" class="form-control" id="search_facebook_url_string_' + number + '" name="search[facebook_url_string_' + number + ']" placeholder="Facebook URL" /><span class="input-group-btn"><button class="btn btn-success btn-add">+</button></span></div>';
	alert(result);
	return result;
}