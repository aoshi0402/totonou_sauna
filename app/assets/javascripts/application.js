// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require activestorage
//= require bootstrap-sprockets
//= require_tree .
//= require highcharts 
//= require highcharts/highcharts-more 

// フラッシュメッセージ
$(function(){
  $('.flash').fadeOut(4000);
});

//aboutページフェードイン

$(function(){
  $(window).on('load scroll',function (){
    $('.animation-bottom').each(function(){
      var target = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var height = $(window).height();
      if (scroll > target - height){
        $(this).addClass('active-bottom');
      }
    });
  });
});

$(function(){
  $(window).on('load scroll',function (){
    $('.animation-right').each(function(){
      var target = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var height = $(window).height();
      if (scroll > target - height){
        $(this).addClass('active-right');
      }
    });
  });
});

$(function(){
  $(window).on('load scroll',function (){
    $('.animation-left').each(function(){
      var target = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var height = $(window).height();
      if (scroll > target - height){
        $(this).addClass('active-left');
      }
    });
  });
});

//aboutページ画像プレビュー

$(function() {
    $('.about-slide-show').slick({
        dots: true,
        autoplay: true,
        autoplaySpeed: 1500,
    });
});
