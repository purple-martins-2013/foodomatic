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
          url: '/favorite_recipes/sort'
      })
    }
  });

  function showBadge(destination) {
    if ($('#' + destination + '-link').size()) {
      $('#' + destination + '-link').ready(function() {

        var request = $.ajax({
          url: destination + '/count_items',
          type: 'GET'
        });

        request.done(function(data){
          if (data.item_count) {
            $('#' + destination + '-link').badger(data.item_count.toString());
          }
        });
      });
    }
  };

  showBadge('favorites');
  showBadge('basket');


  $('.remove-from-favorites').on('ajax:success', function(e, data) {

    $(this).closest('.favorite-recipe').remove();

    if (data.item_count) {
      $('#favorites-link').badger(data.item_count.toString());
    } else {
      $('#favorites-link').find('.badger-outter').remove();
    }
  });

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
  bindAddTo('favorites');

});
