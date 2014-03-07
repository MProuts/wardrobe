jQuery(document).ready(function ($) {
  function sliderify(slider_container) {
      var ul = $(slider_container.children('ul')[0]),
          li = $(ul.children('li')),
          slideCount = li.length,
          slideWidth = li.width(),
          slideHeight = li.height(),
          sliderUlWidth = slideCount * slideWidth;
    slider_container.children(".control_next").click(function(e){
      e.preventDefault()
      moveLeft(slider_container)
    });
    slider_container.children(".control_prev").click(function(e){
      e.preventDefault()
      moveRight(slider_container)
    });

  slider_container.css({ width: slideWidth, height: slideHeight });
	$(slider_container.children('ul')).css({ width: sliderUlWidth, marginLeft: - slideWidth });

  }


    function moveLeft(slider_container) {
      var ul = $(slider_container.children('ul')[0]),
          lc = $(ul.children('li:last-child')),
          li = $(ul.children('li')),
          slideCount = li.length,
          slideWidth = li.width(),
          slideHeight = li.height(),
          sliderUlWidth = slideCount * slideWidth;
	
        ul.animate({
            left: + slideWidth
        }, 200, function () {
            lc.prependTo(ul);
            ul.css('left', '');
        });
    };

    function moveRight(slider_container) {
      var ul = $(slider_container.children('ul')[0]),
          fc = $(ul.children('li:first-child')),
          li = $(ul.children('li')),
          slideCount = li.length,
          slideWidth = li.width(),
          slideHeight = li.height(),
          sliderUlWidth = slideCount * slideWidth;
	
        ul.animate({
            left: - slideWidth
        }, 200, function () {
            fc.prependTo(ul);
            ul.css('left', '');
        });
    };

    $('.slider').each(function(){
      sliderify($(this))
    });
});    

