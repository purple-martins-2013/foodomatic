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

  $("#ingredient_product_id").select2();

  $('.quantity-field').change(function() {
    var item = $(this).closest('div');
    var newCost = $(item).find('.product_price').val() * $(this).val();
   
    ($(item).find('.item-cost').html(newCost)).formatCurrency();
    ($(this).closest('form').find('.total').html(updatedTotal())).formatCurrency();
  });

});
