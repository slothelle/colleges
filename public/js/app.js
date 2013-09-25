$(document).ready(function() {
  $('a.menu').on('click', function(event) {
    event.preventDefault();
    var that = this;
    var url = $(that).attr("href");
    $.get(url, function(response) {
      $(that).after(response);
    })
  });

  $('.container-fluid').on('click', 'a.clear', function(event) {
    event.preventDefault();
    $('.this').remove();
  })
});