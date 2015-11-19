# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  nbSession = 0;
  $('#session').on 'click', (e) ->
    $(this).removeClass('btn-success').addClass('btn-warning disabled').html('RUNNING');
    nbSession++
    timer(nbSession)

timer = (session)->
  elmtTime = $('#time');
  elmtTitle = $('#title');
  nbSession = ['First', 'Second', 'Third', 'Fourth'];
  elmtTitle.html(nbSession[session-1]+" Session");
  sessionDuration = 25 * 60000;
  setInterval () ->
      seconds = (sessionDuration / 1000) % 60;
      minutes = Math.floor((sessionDuration / 60000) % 60);
      seconds = "0"+seconds if seconds<10;
      minutes = "0"+minutes if minutes<10;
      elmtTime.html(minutes+":"+seconds);
      sessionDuration-=1000;
    , 1000
  return

$(document).ready(ready)
$(document).on('page:load', ready)
