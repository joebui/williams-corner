/*price range*/

 $('#sl2').slider();

	var RGBChange = function() {
	  $('#RGB').css('background', 'rgb('+r.getValue()+','+g.getValue()+','+b.getValue()+')')
	};	
		
/*scroll to top*/

$(document).ready(function(){
	$(function () {
		$.scrollUp({
	        scrollName: 'scrollUp', // Element ID
	        scrollDistance: 300, // Distance from top/bottom before showing element (px)
	        scrollFrom: 'top', // 'top' or 'bottom'
	        scrollSpeed: 300, // Speed back to top (ms)
	        easingType: 'linear', // Scroll to top easing (see http://easings.net/)
	        animation: 'fade', // Fade, slide, none
	        animationSpeed: 200, // Animation in speed (ms)
	        scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
					//scrollTarget: false, // Set a custom target element for scrolling to the top
	        scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
	        scrollTitle: false, // Set a custom <a> title if required.
	        scrollImg: false, // Set true to use image
	        activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	        zIndex: 2147483647 // Z-Index for the overlay
		});
	});
});


var set_stars = function(form_id, stars) {
	for(i=1; i <= 5; i++){
		if(i <= stars){
			$('#' + form_id + '_' + i).addClass("on");
		} else {
			$('#' + form_id + '_' + i).removeClass("on");
		}
	}
}

$(function() {
	$('.rating_star').click(function() {
		var star = $(this);
		var form_id = star.attr("data-form-id");
		var stars = star.attr("data-stars");

		$('#' + form_id + '_stars').val(stars);

		$.ajax({
			type: "post",
			url: $('#' + form_id).attr('action'),
			data: $('#' + form_id).serialize()
		})
	});

	$('.star_rating_form').each(function() {
		var form_id = $(this).attr('id');
		set_stars(form_id, $('#' + form_id + '_stars').val());
	});
});
