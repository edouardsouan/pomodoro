# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  nbSession = 0;
  idInterval = [];

  $('#session').on 'click', (e) ->
    $(this).removeClass('btn-success').addClass('btn-warning disabled').html('RUNNING');
    nbSession++;
    idInterval.push timer(nbSession);

  $('#break').on 'click', (e) ->
    idInterval.push rest(nbSession, idInterval);

  $('#stopSession').on 'click', (e) ->
    stop(idInterval);
    nbSession = 0;

timer = (session)->
  elmtTime = $('#time');
  elmtTitle = $('#title');
  elmtStop = $('#stopSession');
  nbSession = ['First', 'Second', 'Third', 'Fourth'];
  sessionDuration = 25 * 60000;

  elmtTitle.html(nbSession[session-1]+" Session");
  elmtStop.removeClass('disabled');
  interval = setInterval () ->
      seconds = formatSeconds(sessionDuration);
      minutes = formatMinutes(sessionDuration);
      elmtTime.html(minutes+":"+seconds);
      sessionDuration-=1000;
    , 1000
  return interval;

stop = (idInterval)->
  elmtStop = $('#stopSession');
  elmtTime = $('#time');
  elmtTitle = $('#title');
  elmtSession = $('#session');

  elmtStop.addClass('disabled');
  elmtSession.removeClass('btn-warning disabled').addClass('btn-success').html('START');
  elmtTitle.html('Session Aborted');
  elmtTime.html('');
  stopInterval(idInterval) if idInterval;
  return

rest = (session, idInterval) ->
  elmtBreak = $('#break');
  elmtTime = $('#time');
  elmtStop = $('#stopSession');
  breakDuration = 5 * 60000;

  elmtStop.removeClass('disabled');
  clearInterval(idInterval) if idInterval;
  interval = setInterval () ->
    seconds = formatSeconds(breakDuration);
    minutes = formatMinutes(breakDuration);
    elmtTime.html(minutes+":"+seconds);
    breakDuration-=1000;
  , 1000
  return interval

stopInterval = (idInterval) ->
  clearInterval(id) for id in idInterval
  return

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
