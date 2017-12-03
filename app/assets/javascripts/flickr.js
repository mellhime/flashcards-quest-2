function chooseImage(image) {
  $("#card_image_url").val(image.src);
}

$(document).ready(function() {
  $("#target").on("click", function() {
    $("#search").show();
    $("#target").hide();
  });

  $("#search_button").on("click", function() {
    var search_input = $("#search_input");

    $.ajax({

      dataType: 'json',
      url: '/photos/search',
      data: { "search_input" : search_input.val() },
      success: function(data){
        data.map( function(image) {
          var image_id = image.slice(-16).substr(0, 10);
          $('#search_results').append('<img id="image'+ image_id +'" src="'+ image +'" alt="image" onclick="chooseImage(this);" />');
        });
      } 
    });
  });
});
