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

  $('.add-to-queue').on('click', function(e) {
    e.preventDefault();
    $('#queue-link').effect('bounce', {times: 3}, "slow").badger('+5');
  });

  $('.add-to-basket').on('click', function(e) {
    e.preventDefault();
    $('#basket-link').effect('bounce', {times: 3}, "slow").badger('+5');
  });
});
