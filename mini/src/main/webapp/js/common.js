$(document).ready(function(){

	let agent = navigator.userAgent.toLowerCase();


	$("#header").mouseenter(function(){
		$(this).addClass("active");
	});

	$("#header").mouseleave(function(){
		if(!$(".box-search").hasClass("active") && !$(".sitemap").hasClass("active")){
			$(this).removeClass("active");
		}
	});

	/*2021-08-26*/
	$('.header.type01 > .wrap > .navs > .box-nav > .fragment .wrap .right > .box-nav > .box-nav').each(function(){
		if($(this).find('.nav').length>0){
			$(this).prev('.nav').css('cursor','default')
					.parent().addClass('has-dep');
		}
	});

	$(".header.type01 .sitemap .box-nav-wrap > .box-nav > .nav").click(function(event){
		if($(window).width() < 1236){
			event.preventDefault();
			event.stopPropagation();

			$(".header.type01 .sitemap .box-nav-wrap > .box-nav > .nav").removeClass("active");
			$(this).toggleClass("active");
		}
	});

	$(".header.type01 .sitemap .box-nav-wrap > .box-nav > .box-nav > .nav").click(function(event){
		let activated = false;

		if($(window).width() < 1236){
			if($(this).next(".box-nav").children(".nav").length > 0){
				event.preventDefault();
				event.stopPropagation();

				activated = $(this).hasClass("active");

				$(".header.type01 .sitemap .box-nav-wrap > .box-nav > .box-nav > .nav").removeClass("active");
				activated ? $(this).removeClass("active") : $(this).addClass("active");
			}
		}
	});

	if($(window).scrollTop()>0){
		$("#header").addClass("active");
	}

	$(window).scroll(function(){
		if($(window).scrollTop() + $(window).height() == $(document).height()) {
			$(".btn-top").addClass("hide");
			// $("#header").addClass("active");
		}else{
			$(".btn-top").removeClass("hide");
			if(!$(".box-search").hasClass("active") && !$(".sitemap").hasClass("active")){
				// $("#header").removeClass("active");
			}
		}

		if($(window).scrollTop()>0){
			$("#header").addClass("active");
		}else{
			if(!$(".box-search").hasClass("active") && !$(".sitemap").hasClass("active")){
				$("#header").removeClass("active");
			}
		}
	});


});
