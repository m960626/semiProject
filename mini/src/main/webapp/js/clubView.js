
//클럽 회원 정보 보기

$(document).on("click", "#tab1 .section .tbl .userOnly tr", function() {
	 $('.user-read').fadeIn().addClass('on');
	 $('.read-inner').fadeIn().addClass('on');
	 $("body").css("overflow", "hidden"); //body 스크롤바 없애기
});

$(document).on("click", ".dimClose", function() {
	 $('.user-read').fadeOut().removeClass('on');
	 $('.read-inner').fadeOut().removeClass('on');
	 $("body").css("overflow", "visible"); //body 스크롤바 없애기
	 
});

/*
$(document).on("click", "#tab1 .section .tbl tbody tr", function() {
	$(".read-inner").css({
      "top": (($(window).height() - $(".read-inner").outerHeight()) / 2 + $(window).scrollTop()) + "px",
      "left": (($(window).width() - $(".read-inner").outerWidth()) / 2 + $(window).scrollLeft()) + "px"
      //팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
    });
    $("body").css("overflow", "hidden"); //body 스크롤바 없애기
});

  //카드형 게시판 dim 팝업 반응형
  $(document).ready(function() {
    $('.read-inner').css('height', $(window).height() / 1.35);
    $('.read-inner').css('width', $(window).width() / 1.15);
    $('.read-inner').css('left', (($(window).width() - $(".read-inner").outerWidth()) / 2 + $(window).scrollLeft()) + "px");
    $('.read-inner').css('top', (($(window).height() - $(".read-inner").outerHeight()) / 2 + $(window).scrollTop()) + "px");

    $(window).resize(function() {
      $('.read-inner').css('height', $(window).height() / 1.35);
      $('.read-inner').css('width', $(window).width() / 1.15);
      $('.read-inner').css('left', (($(window).width() - $(".read-inner").outerWidth()) / 2 + $(window).scrollLeft()) + "px");
      $('.read-inner').css('top', (($(window).height() - $(".read-inner").outerHeight()) / 2 + $(window).scrollTop()) + "px");
    });
  });
 */
 