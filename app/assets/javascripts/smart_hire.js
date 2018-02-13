// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
 let $jobbtn = $('#job_search');
 $jobbtn.val("Job Title/Keyword").css({opacity: 0.5});



 $jobbtn.click(function() {
   $jobbtn.val("").css({opacity: 1.0});
 })

 let $locbtn = $('#location');
 $locbtn.val("City/State").css({opacity: 0.5});

 $locbtn.click(function() {
   $locbtn.val("").css({opacity: 1.0});
 })

 let $result = $('.results');
  let $deleteMsg = $('.delete');
  $deleteMsg.on('click', function(){
    let $job = $('.jobs');
    $job.remove();
  })

});
