$(function(){
  filterParksList();
})

function filterParksList(){
  parks = $('#game_park_id').html();
  $('#game_game_category').change(function(){
    game_category = $('#game_game_category :selected').text();
    optgroup = "optgroup[label='"+ game_category + "']"
    options = $(parks).filter(optgroup).html();

    if(game_category != ""){ 
      $('#game_park_id').html(options);
    }
  }); 
}
