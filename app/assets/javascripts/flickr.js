function chooseImage() {
  var image_input = $("#image_id");
  console.log(image_input);

  $.ajax({

    dataType: 'json',
    url: '/cards/new',
    data: { "image" : image_input.val() },
  });
}

$(document).ready(function() {
  $("#target").on("click", function() {
    $("#search").show();
    $("#target").hide();
  });

  $("#search_button").on("click", function() {
    var search_input = $("#search_input");
    $('#search #images').remove();

    $.ajax({

      dataType: 'json',
      url: '/photos/search',
      data: { "search_input" : search_input.val() },
      success: function(data){
        data.map( function(image) {
          $('#search').append('<img id="image_id" src="'+ image +'" alt="image" onclick="chooseImage();" />');
        });
      } 
    });
  });
});
