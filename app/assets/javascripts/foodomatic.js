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
  
  $('.queue-it').on('click', function(e) {
    e.preventDefault();
    $('#queue').effect('bounce', {times: 3}, "slow").badger('+5');
  });
});
