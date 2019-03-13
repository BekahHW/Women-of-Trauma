$(document).ready(function() {
  listenForClick()
});

// Add listener to a tags on disorders
function listenForClick(){
  $('.disorder').on('click', function(event) {
    event.preventDefault()
    getUserDisorders()
  })
}


function getUserDisorders(){
  
}
