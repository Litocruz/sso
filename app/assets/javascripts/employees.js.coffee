# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#employees').dataTable()
    sPaginationType: "full_number"
    bJQueryUI: true
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#employees').data('source')
