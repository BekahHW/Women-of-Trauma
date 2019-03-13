//$(function(){
  //console.log('it works`')
//})

$(document).ready(function() {
  console.log("?????")
  //listenForClick()
});

// $(document).on('turbolinks:load', function(){
//   console.log("it works")
// })

// Add listener to a tags on disorders
function listenForClick(){
  $('.disorder_link').on('click', function(event) {
    event.preventDefault()
    console.log("hello")
    // getUserDisorders()
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
