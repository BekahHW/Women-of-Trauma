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
  let newDisorder = new Disorder(data[0])
  let newDisorderHTML = newDisorder.postHTML()
  $('p').text(newDisorderHTML)
}

class Disorder {
  constructor(obj){
    this.id = obj.id
    this.name = obj.name
  }
}

Disorder.prototype.disorderHTML = function() {
  return {`
    <p>this.user_disorder.id.narrative</p>`}
}
