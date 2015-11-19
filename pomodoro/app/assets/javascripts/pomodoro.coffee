# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  nbSession = 0;
  $('#session').on 'click', (e) ->
    $(this).removeClass('btn-success').addClass('btn-warning disabled').html('RUNNING');
    clearIntervall(idInterval) if idInterval;
    nbSession++
    idInterval = timer(nbSession);

timer = (session)->
  elmtTime = $('#time');
  elmtTitle = $('#title');
  nbSession = ['First', 'Second', 'Third', 'Fourth'];
  elmtTitle.html(nbSession[session-1]+" Session");
  sessionDuration = 25 * 60000;
  interval = setInterval () ->
      seconds = formatSeconds(sessionDuration);
      minutes = formatMinutes(sessionDuration);
      elmtTime.html(minutes+":"+seconds);
      sessionDuration-=1000;
    , 1000
  return interval;

formatSeconds = (secondToFormat) ->
  seconds = (secondToFormat / 1000) % 60;
  seconds = "0"+seconds if seconds<10;
  return seconds

formatMinutes = (minutesToFormat) ->
  minutes = Math.floor((minutesToFormat / 60000) % 60);
  minutes = "0"+minutes if minutes<10;
  return minutes;

$(document).ready(ready)
$(document).on('page:load', ready)
