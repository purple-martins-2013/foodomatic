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

  if ($('#favorites-link').size() > 0) {
    $('#favorites-link').ready(function() {

      var badge_favorites = $.ajax({
        url: 'favorites/count_items',
        type: 'GET'
      });

      badge_favorites.done(function(data){

        favorites_badge_start =  data.item_count;
        if (favorites_badge_start > 0) {
          $('#favorites-link').badger(favorites_badge_start.toString());
        }
      });

    });
  };

  if ($('#basket-link').size() > 0) {
    $('#basket-link').ready(function() {

      var badge_basket = $.ajax({
        url: 'basket/count_items',
        type: 'GET'
      });

      badge_basket.done(function(data){

        basket_badge_start = data.item_count;
        if (basket_badge_start > 0) {
          $('#basket-link').badger(basket_badge_start.toString());
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
  bindAddTo('favorites');

  $('.remove-from-favorites').on('ajax:success', function() {
    $(this).closest('.favorite-recipe').remove();
  })

});
