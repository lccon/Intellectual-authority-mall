$(function() {

    /* 小图控制大图*/
  
    $(".detail-box .preview-items li").on('click', function() {
      var index = $(this).index()+1;
      /*  console.log(index);*/
      var src = $(".detail-box .preview-box a img").attr("src");
      var subsrc = src.substring(0, src.length - 5);
      subsrc +=index + '.jpg'
       console.log(subsrc)
      $(".detail-box .preview-box a img").attr("src", subsrc)
    })
    });