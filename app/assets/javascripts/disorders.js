//$(function(){
  //console.log('it works`')
//})
let globalDataStore = null
window.init = function() {
$(function() {
  $.ajax( {
    url: 'http://localhost:3000/disorders',
    method: 'get',
    dataType: 'json',
  }).done(function(data){
    globalDataStore = data.data
    // data.data.map(disorder => {
    //   $('h1').after(`<p class='disorder'><a href="" id='${disorder.id}'>${disorder.attributes.name}</a></p>`)
    // })
  })

  listenForClick()
});
}

init()

// Add listener to a tags on disorders
function listenForClick(){
  $('.disorder_link').on('click', function(event) {
    event.preventDefault()
    let id = $(this).attr('id')
    getDisorderShow(id)
  })
}


function getDisorderShow(id){
  let newDisorder = new Disorder(globalDataStore[id - 1])
  let newDisorderHTML = newDisorder.description
  $(`#description${newDisorder.id}`).text(newDisorderHTML)
}

class Disorder {
  constructor(obj){
    this.id = obj.id
    this.name = obj.attributes.name
    this.description = obj.attributes.description
  }
}

Disorder.prototype.disorderHTML = function() {
  return (`
    <p>${this.name}</p>`)
}
