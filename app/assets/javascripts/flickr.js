$(document).ready(function() {
  $("#target").on("click", function() {
    $("#search").show();
    $("#target").hide();
  });

  $("#search_button").on("click", function() {
    // console.log("success");
    var search_input = $("#search_input");
    $('#search #images').remove();

    $.ajax({
      dataType: 'json',
      quietMillis: 1500,
      url: '/photos/search',
      data: { "search_input" : search_input.val() },
      success: function(data){
        data.map( function(image) {
          console.log(image);
          $('#search').append('<div id="images"><img src="'+ image +'" alt="image" /></div>');
        })
      } 
    });
  });
});
