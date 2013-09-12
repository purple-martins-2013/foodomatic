function Badge(destination) {
  this.destination = destination;
  var self = this;

  this.refresh().done(function(itemCount) {
    self.render(itemCount);
  });
}

Badge.prototype.render = function(itemCount, options) {
  options = options || {}
  var $destinationLink = $('#' + this.destination + '-link');
  if (itemCount === 0) {
    $destinationLink.find('.badger-outter').remove();
  } else {
    var newCount = itemCount.toString();
    $destinationLink.badger(newCount);
    if (options.bounce) {
      $destinationLink.stop().effect('bounce', {times: 1}, "fast");
    }
  }
}

Badge.prototype.add = function(url, recipeContainer) {
  var self = this;
  var request = $.ajax({
    url: url,
    type: 'POST'
  }).done(function(data){
    self.render(data.item_count, { bounce: true })
    if (data.item_in_basket) {
      recipeContainer.addClass(data.container_type)
    }
  });
}

Badge.prototype.remove = function(url, recipeContainer) {
  var self = this;
  var request = $.ajax({
    url: url,
    type: 'DELETE'
  }).done(function(data){
    self.render(data.item_count, { bounce: true })
    if (!data.item_in_basket) {
      recipeContainer.removeClass(data.container_type)
    }
  });
}

Badge.prototype.refresh = function() {
  var promise = $.Deferred()
    $.ajax({
      url: this.destination + '/count_items', type: 'GET'
    }).done(function(data) {
      promise.resolve(data.item_count);
    });

  return promise;
}
