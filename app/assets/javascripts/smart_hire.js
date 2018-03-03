// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {

  let $result = $('.results');
  let $deleteMsg = $('.delete');
  $deleteMsg.on('click', function(){
    let $job = $('.jobs');
    $job.remove();
  })

});
