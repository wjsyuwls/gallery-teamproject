
/*메인이미지 자동슬라이드쇼*/

$(document).ready(function () {
	$(".mySlideDiv").not(".active").hide(); //화면 로딩 후 첫번째 div를 제외한 나머지 숨김
	
	setInterval(nextSlide, 4000); //4초(4000)마다 다음 슬라이드로 넘어감
});

//이전 슬라이드
function prevSlide() {
	$(".mySlideDiv").hide(); //모든 div 숨김
	var allSlide = $(".mySlideDiv"); //모든 div 객체를 변수에 저장
	var currentIndex = 0; //현재 나타난 슬라이드의 인덱스 변수
	
	//반복문으로 현재 active클래스를 가진 div를 찾아 index 저장
	$(".mySlideDiv").each(function(index,item){ 
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	//새롭게 나타낼 div의 index
	var newIndex = 0;
    
	if(currentIndex <= 0) {
		//현재 슬라이드의 index가 0인 경우 마지막 슬라이드로 보냄(무한반복)
		newIndex = allSlide.length-1;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 뒤로 간 index 지정
		newIndex = currentIndex-1;
	}

	//모든 div에서 active 클래스 제거
	$(".mySlideDiv").removeClass("active");
    
	//새롭게 지정한 index번째 슬라이드에 active 클래스 부여 후 show()
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();

}

//다음 슬라이드
function nextSlide() {
	$(".mySlideDiv").hide();
	var allSlide = $(".mySlideDiv");
	var currentIndex = 0;
	
	$(".mySlideDiv").each(function(index,item){
		if($(this).hasClass("active")) {
			currentIndex = index;
		}
        
	});
	
	var newIndex = 0;
	
	if(currentIndex >= allSlide.length-1) {
		//현재 슬라이드 index가 마지막 순서면 0번째로 보냄(무한반복)
		newIndex = 0;
	} else {
		//현재 슬라이드의 index에서 한 칸 만큼 앞으로 간 index 지정
		newIndex = currentIndex+1;
	}

	$(".mySlideDiv").removeClass("active");
	$(".mySlideDiv").eq(newIndex).addClass("active");
	$(".mySlideDiv").eq(newIndex).show();	
}


/* 화면 서서히 불러오기 */
jQuery(function ($) {
    $("#ex_detail_group_wrapper").css("display", "none");
    $("#ex_detail_group_wrapper").fadeIn(2000);
    $("a.transition").click(function (event) {
        event.preventDefault();
        linkLocation = this.href;
        $("#ex_detail_group_wrapper").fadeOut(1000, redirectPage);
    });

    function redirectPage() {
        window.location = linkLocation;
    }
});	


	//CV 이미지 호버이벤트
	$(function() {
		$(document).ready(function() {
			$(".cv_info_name").hide();
			$(".cv_info:eq(0)").hover(function() {
				$(this).children(".cv_info img").fadeOut(400);
				$(this).children(".cv_info_name").fadeIn(400);
			}, function() {
				$(this).children(".cv_info img").fadeIn(400);
				$(this).children(".cv_info_name").fadeOut(400);
			});
			$(".cv_info:gt(0)").hover(function() {
				$(this).children(".cv_info img").fadeOut(400);
				$(this).children(".cv_info_name").fadeIn(400);
			}, function() {
				$(this).children(".cv_info img").fadeIn(400);
				$(this).children(".cv_info_name").fadeOut(400);
			});
		});
	});
