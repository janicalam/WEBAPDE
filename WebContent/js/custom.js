$(".td-active").click(function(e) {

	if(!$(this).hasClass("td-select")){
		$(this).addClass("td-select");
	} else {
		$(this).removeClass("td-select");
	}


});

$("html").click(function(e) {
	if(!$(".modal").hasClass("in")){
		$(".td-active").removeClass("td-select");
	}
});