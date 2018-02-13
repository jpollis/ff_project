// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
 // let $jobbtn = $('#job_search');
 // $jobbtn.val("Job Title/Keyword");

 $jobbtn.click(function() {
   $jobbtn.val("");
 })

 // $jobbtn.keypress(function() {
 //   $jobbtn.css({opacity: 1.0});
 // })
 // 
 // let $locbtn = $('#location');
 // $locbtn.val("City/State");

 $locbtn.on('click', function() {
   $locbtn.val("").css({color: black});
 })

 // $locbtn.keypress(function() {
 //   $locbtn.css({opacity: 1.0});
 // })

 let $result = $('.results');
  let $deleteMsg = $('.delete');
  $deleteMsg.on('click', function(){
    let $job = $('.jobs');
    $job.remove();
  })

});
