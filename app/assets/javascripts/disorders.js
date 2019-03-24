
let globalDataStore = null

$(function() {
  $.ajax( {
    url: 'http://localhost:3000/disorders',
    method: 'get',
    dataType: 'json',
  }).done(function(data){
    globalDataStore = data.data
  })
  listenForClick()
});

function listenForClick(){
  $('.disorder_link').on('click', function(event) {
// Prevents reloading and going to the page when clicked
    event.preventDefault()

    // Get the id of the clicked link
    let id = $(this).attr('id')
    getDisorderShow(id)
  })
}


function getDisorderShow(id){
  let newDisorder = new Disorder(globalDataStore[id - 1])

  let newDisorderHTML = newDisorder.disorderHTML()
  $(`#description${newDisorder.id}`).html(newDisorderHTML)
}


class Disorder {
  constructor(obj){
    this.id = obj.id
    this.name = obj.attributes.name
    this.description = obj.attributes.description
    this.narrative = obj.attributes.user_disorders
  }
}

Disorder.prototype.disorderHTML = function() {
  let disorderUserDisorders = this.narrative.map(user_disorder => {
    return (`<p>${user_disorder.narrative}</p>
`)
  }).join('')
  return (`
    <div class='disorder'>
    <h4>${this.description}</h4>
     <p>${disorderUserDisorders}</p>

    </div>
    `)
}
