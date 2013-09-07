$(document).ready(function() {
  $('.add-to-queue').on('click', function(e) {
    e.preventDefault();
    $('#queue-link').effect('bounce', {times: 3}, "slow").badger('+5');
  });
  $('.add-to-basket').on('click', function(e) {
    e.preventDefault();
    $('#basket-link').effect('bounce', {times: 3}, "slow").badger('+5');
  });
});
