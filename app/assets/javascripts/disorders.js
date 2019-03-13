$(function(){
  console.log('it works`')
})

$(document).ready(function() {
  listenForClick()
});

// Add listener to a tags on disorders
function listenForClick(){
  $('a').on('click', function(event) {
    event.preventDefault()
    getUserDisorders()
  })
}


function getUserDisorders(){
  $.ajax( {
    url: 'http://localhost:3000/disorders',
    method: 'get',
    dataType: 'json',
  }).done function(data)
  console.log('the data is:', data)
}

class Disorder {
  constuctor(obj){
    this.id = obj.id
    this.name = obj.name
  }
}
