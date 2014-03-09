jQuery(document).ready(function ($) {

  function sliderify(slider_container) {
      var ul = $(slider_container.children('ul')[0]),
          li = $(ul.children('li')),
          sc = $(ul.children('li:nth-child(2)')),
          slideCount = li.length,
          slideWidth = li.width(),
          slideHeight = li.height(),
          sliderUlWidth = slideCount * slideWidth;
    slider_container.children(".control_next").click(function(e){
      e.preventDefault()
      moveRight(slider_container)
    });
    slider_container.children(".control_prev").click(function(e){
      e.preventDefault()
      moveLeft(slider_container)
    });

  slider_container.css({ width: slideWidth, height: slideHeight });
	$(slider_container.children('ul')).css({ width: sliderUlWidth, marginLeft: - slideWidth });

  current_article_id = (sc.attr("id"));
  if (slider_container.attr("for") == "top_id") {
    $("#top_id").val(current_article_id);
  }

  if (slider_container.attr("for") == "bottom_id") {
    $("#bottom_id").val(current_article_id);
  }

  }


  function moveRight(slider_container) {
    var ul = $(slider_container.children('ul')[0]),
        fc = $(ul.children('li:first')),
        lc = $(ul.children('li:last-child')),
        li = $(ul.children('li')),
        slideCount = li.length,
        slideWidth = li.width(),
        slideHeight = li.height(),
        sliderUlWidth = slideCount * slideWidth;

    current_article_id = fc.attr("id")
    if (slider_container.attr("for") == "top_id") {
      $("#top_id").val(current_article_id);
    }
      
    if (slider_container.attr("for") == "bottom_id") {
      $("#bottom_id").val(current_article_id);
    }
	
    ul.animate({
      left: + slideWidth
    }, 200, function () {
      lc.prependTo(ul);
      ul.css('left', '');
    });
        
  };

  function moveLeft(slider_container) {
    var ul = $(slider_container.children('ul')[0]),
        tc = $(ul.children('li:nth-child(3)')),
        fc = $(ul.children('li:first-child')),
        li = $(ul.children('li')),
        slideCount = li.length,
        slideWidth = li.width(),
        slideHeight = li.height(),
        sliderUlWidth = slideCount * slideWidth;

    current_article_id = tc.attr("id")
    if (slider_container.attr("for") == "top_id") {
      $("#top_id").val(current_article_id);
    }
      
    if (slider_container.attr("for") == "bottom_id") {
      $("#bottom_id").val(current_article_id);
    }

    ul.animate({
      left: - slideWidth
    }, 200, function () {
      fc.appendTo(ul);
      ul.css('left', '');
    });
  };

  $('.slider').each(function(){
    sliderify($(this), $(this).attr("id"))
  });

  $("#submit_button").click(function(e){
    value2 = $("#bottom_id").val();
  });
});    

