$(document).ready(function(){
  createGrid();
  colorOver();
  resetGame();
});

function createGrid() {
  var grid = $('#game');
  var resetButton = '<br/><button type="button"> Reset </button>';
  for (var i = 0; i < 16; i++) {
    var row = '<div>';
    for (var j = 0; j < 16; j++) {
      row += '<div class="square">';
      row += '</div>';
    }
    row += '</div>';
    grid.append(row);
  }
  grid.append(resetButton);
}

function colorOver() {
  $(".square").mouseover(function() {
    $(this).css("background-color", "red");
  });
}

function resetGame() {
  $('button').click(function() {
    $('.square').css("background-color", "yellow");
  });
}
