$(document).ready(function() {

  var favoritesBadge = new Badge('favorites');
  var basketBadge = new Badge('basket');


  $('.remove-from-favorites').on('ajax:success', function(e, data) {
    $(this).closest('.favorite-recipe').remove();
    favoritesBadge.render(data.item_count);
  });

  function bindAddTo(destination, badge) {
    $('.add-to-' + destination).on('click', function(e) {
      e.preventDefault();
      badge.add($(this).attr('href'));
    });
  }

  bindAddTo('basket', basketBadge);
  bindAddTo('favorites', favoritesBadge);

  $(".imgLiquidFill").imgLiquid();

  $("#ingredient_product_id").select2({
    placeholder: "Select a Product",
    allowClear: true
  });
});
