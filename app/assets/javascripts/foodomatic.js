$(document).ready(function() {
  $('.queue-it').on('click', function(e) {
    e.preventDefault();
    $('#queue').effect('bounce', {times: 3}, "slow").badger('+5');
  });
});
