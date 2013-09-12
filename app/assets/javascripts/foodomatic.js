$(document).ready(function() {

  var favoritesBadge = new Badge('favorites');
  var basketBadge = new Badge('basket');

  function bindAddTo(destination, badge) {
    $('.add-to-' + destination).on('click', function(e) {
      e.preventDefault();
      var recipeContainer = $(this).closest('.recipe-container');
      badge.add($(this).attr('href'), recipeContainer);
    });
  }

  function bindRemoveFrom(destination, badge) {
    $('.remove-from-' + destination).on('click', function(e) {
      e.preventDefault();
      var recipeContainer = $(this).closest('.recipe-container');
      badge.remove($(this).attr('href'), recipeContainer);
    });
  };

  bindAddTo('basket', basketBadge);
  bindAddTo('favorites', favoritesBadge);
  bindRemoveFrom('favorites', favoritesBadge);
  bindRemoveFrom('basket', basketBadge);

  $(".imgLiquidFill").imgLiquid();

  $('.quantity-field').change(function() {
    var item = $(this).closest('div');
    var newCost = $(item).find('.product_price').val() * $(this).val();

    ($(item).find('.item-cost').html(newCost)).formatCurrency();
    ($(this).closest('form').find('.total').html(updatedTotal())).formatCurrency();
  });

  $("#ingredient_product_id").select2({
    placeholder: "Select a Product",
    allowClear: true
  });

  function updatedTotal() {
    var productCosts = []
    var costElements = $('#new_order').find('.item-cost')
    for (var i = 0; i < costElements.length; i++) {
      var cost = parseFloat($(costElements[i]).html().substring(1))
      productCosts.push(cost)
    }

    var total = 0;
    $.each(productCosts, function() {
      total += this;
    });
    return total;
  };

});
