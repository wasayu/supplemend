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
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


/* global $*/

/* トップページの動き（ここから） */
document.addEventListener("turbolinks:load", function() {
  $(function(){
    $('.animated').waypoint({
      handler(direction) {
        if (direction === 'down') {
          $(this.element).addClass('fadeInLeft');
          this.destroy();
        }
      },
      /**
       * 要素の上端が画面のどの位置に来たときにhandlerメソッドを呼び出すか指定
       * 0%なら画面の一番上、100%なら画面の一番下に来たときに呼び出される
       */
      offset: '100%',
    });
  });
});

document.addEventListener("turbolinks:load", function() {
  $(function(){
    $('.img-container').waypoint(function(direction){
      var activePoint = $(this.element);
      //scroll down
      if (direction === 'down') {
        activePoint.addClass('active');
        this.destroy();
      }
    },{offset : '70%'});
     
    $('.text-container').waypoint(function(direction){
      var activePoint = $(this.element);
      //scroll down
      if (direction === 'down') {
        activePoint.addClass('active');
        this.destroy();
      }
    },{offset : '70%'});  
  });
});  
  
/* トップページの動き（ここまで） */


/* 入力画面の動き（ここから） */
document.addEventListener("turbolinks:load", function() {
  $(function(){
    $('.purpose-button').on('click', () => {
      if($("input[name='menu[purpose]']:checked").val()) {
        const training_content = $("input[name='menu[purpose]']:checked").val();
        console.log(training_content);
        $('.purpose-content').text(training_content);
  
        $('.purpose-select').hide();
        $('.budget-select').show();
      }
    });  
  });
  
  $(function(){
    $('.budget-button').on('click', () => {
      if($("input[name='menu[budget]']:checked").val()) {
        const budget_content = $("input[name='menu[budget]']:checked").val();
        console.log(budget_content);    
    
        $('.budget-content').text(budget_content);
      
        $('.budget-select').hide();
        $('.select-result').show();
      }
    });
  });
});
/* 入力画面の動き（ここまで） */


/* マイページのタブ */
document.addEventListener("turbolinks:load", function() {
  $(function(){
    const showTab = (selector) => {
      console.log(selector);
      $('.tabs-menu > .card').removeClass('active');
    
      $('.tabs-content > section').hide();
      
      $(`.tabs-menu a[href="${selector}"]`)
        .parent('.card')
        .addClass('active');
    
      $(selector).show();
    };  
  
  
    $('.tabs-menu a').on('click', (e) => {
      // hrefへのページ遷移を止める
      e.preventDefault();
    
      // hrefの値を受け取った後、showTab()関数に渡す。e.targetはクリックされたタブ（.tabs-menu a）を表す
      const selector = $(e.target).attr('href');
      console.log(e.target);
      console.log(selector);
      showTab(selector);
    });  
  });
});
/* マイページのタブ(ここまで) */


/* トップページの動き（ここから） */
document.addEventListener("turbolinks:load", function() {
  $(function(){
    $('.animated2').waypoint({
      handler(direction) {
        if (direction === 'down') {
          $(this.element).addClass('animated');
          $(this.element).addClass('fadeInUp');
          this.destroy();
        }
      },
      /**
       * 要素の上端が画面のどの位置に来たときにhandlerメソッドを呼び出すか指定
       * 0%なら画面の一番上、100%なら画面の一番下に来たときに呼び出される
       */
      offset: '30%',
    });
  });
});

/* トップページの動き（ここまで） */












