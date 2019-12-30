$(function() {
  $('img.thumb').mouseover(function(){
  var selectedSrc = $(this).attr('src').replace(/^(.+)_thumb(\.gif|\.jpg|\.png+)$/, "$1"+"$2");
  
  $('img.mainImage').stop().fadeOut(50,
  function(){
  $('img.mainImage').attr('src', selectedSrc);
  $('img.mainImage').stop().fadeIn(200);
  }
  );
  });
  
  $('img.thumb').mouseout(function(){
  $(this).css({"border":""});
  });
});
