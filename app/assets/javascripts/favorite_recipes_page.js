function FavoriteRecipesPage() {
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
}
