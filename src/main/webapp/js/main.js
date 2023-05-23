window.addEventListener('DOMContentLoaded', function() {
	
	  // 배너 정지버튼
	  function bnr_stop(bnr, btn) {
		if (btn.text() === '정지') {
		  bnr.slick('slickPause');
		  btn.text('시작');
		  btn.addClass('start');
		  btn.removeClass('stop');
		} else {
		  bnr.slick('slickPlay');
		  btn.text('정지');
		  btn.addClass('stop');
		  btn.removeClass('start');
		};
	  };


	  /*매칭일정 슬라이드*/
	  if ($('.schedule_wrap').length) {
		var schedule_bnr = $(".schedule_list");
		schedule_bnr.slick({
		  infinite: true,
		  accessibility: true,
		  slidesToScroll: 1,
		  slidesToShow: 4,
		  autoplay: true,
		  draggable: false,
		  prevArrow: $('.schedule_control .prev'),
		  nextArrow: $('.schedule_control .next'),
		  responsive: [{
			  settings: {
				infinite: true,
				accessibility: true,
				slidesToScroll: 1,
				slidesToShow: 3,
				autoplay: true,
				draggable: false,
				prevArrow: $('.schedule_control .prev'),
				nextArrow: $('.schedule_control .next'),
			  }
			}
		  ]
		});
		$('.schedule_control .stop, .schedule_control .start').click(function() {
		  bnr_stop(schedule_bnr, $(this));
		});
	  }
	  /*//매칭일정 슬라이드*/
});	  
	    
	
		


