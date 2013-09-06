$(document).ready(function() {
  $('.available-recipe').each(function() {
    new AvailableRecipeView(this);
  });

  new QueueView();
});


function AvailableRecipeView(recipe) {
  $(recipe).draggable({ helper: 'clone' })

}


function QueueView() {
  var queue = $('.queue');
  queue.droppable( {
    accept: '.recipe'
  });
  queue.sortable();
  queue.on('drop',function(e, ui) {
    if (ui.draggable.hasClass('available-recipe')) {
      var sortableRecipe = new SortableRecipeView(ui.draggable.clone())
      queue.append(sortableRecipe.element);
    }
  });
}

function SortableRecipeView(recipe) {
  this.element = recipe;
  this.element.removeClass('available-recipe');
  this.element.find('.queue-it').remove();
}
