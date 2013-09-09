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

  $('.add-to-queue').on('click', function(e) {
    e.preventDefault();

    var request = $.ajax({
      url: $(this).attr('href'),
      type: 'POST'
    });

    request.done(function(data){
      var badge = (data.queued_recipes_count).toString();
      $('#queue-link').effect('bounce', {times: 3}, "slow").badger(badge);
    });

  });

  $('.add-to-basket').on('click', function(e) {
    e.preventDefault();
    $('#basket-link').effect('bounce', {times: 3}, "slow").badger('+5');
  });

});
