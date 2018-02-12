// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function() {
 let $jobbtn = $('#job_search');
 $jobbtn.val("Job Title/Keyword");



 $jobbtn.click(function() {
   $jobbtn.val("");
 })

 let $locbtn = $('#location');
 $locbtn.val("City/State");

 $locbtn.click(function() {
   $locbtn.val("");
 })
});
