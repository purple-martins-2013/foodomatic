$(document).ready(function() {
 
  $('.sortable').sortable({
    axis: 'y',
    dropOnEmpty: false,
    handle: '.handle',
    cursor: 'crosshair',
    items: 'li',
    opacity: 0.4,
    scroll: true,
    update: function() {
      $.ajax({
        type: 'post',
        data: $('.sortable').sortable('serialize'),
        dataType: 'script',
        complete: function(request) {
          $('.sortable').effect('highlight');
        },
          url: '/queued_recipes/sort'
      })
    }
  });
  if ($('#queue-link').size() > 0) {
    $('#queue-link').ready(function() {

      var badge_info = $.ajax({
        url: 'queued_recipes',
        type: 'GET'
      });

      badge_info.done(function(data){
        badge_start = $($(data)).find('#queued-recipe-list li').size();
        if (badge_start > 0) {
          $('#queue-link').badger(badge_start.toString());
        }
      });

    });
  };

  function bindAddTo(destination) {
    $('.add-to-' + destination).on('click', function(e) {
      e.preventDefault();

      var request = $.ajax({
        url: $(this).attr('href'),
        type: 'POST'
      });

      request.done(function(data){
        var badge = (data.item_count).toString();
        $('#' + destination + '-link').effect('bounce', {times: 3}, "slow").badger(badge);
      });

    });
  }

  bindAddTo('basket');
  bindAddTo('queue');

  $('.remove-from-queue').on('ajax:success', function() {
    $(this).closest('.queued-recipe').remove();
  })

});
