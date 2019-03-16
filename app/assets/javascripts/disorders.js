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
  // debugger
  // let newDisorderHTML = newDisorder.description
  let newDisorderHTML = newDisorder.disorderHTML()
  $(`#description${newDisorder.id}`).text(newDisorderHTML).append('<p><button type="button" class="btn btn-primary" id="seeStories">See Stories</button></p>')
  // listenForStoryClick()
}

// function listenForStoryClick(){
//   $('#seeStories').on('click', function(event) {
//     event.preventDefault()
//     console.log("Stories have been clicked")
//     let id = $(this).attr('id')
//     getStoriesShow(id)
//   })
// }
//
// function getStoriesShow(id){
//   console.log("Stories go here")
//   // debugger
//   //
//   // $(`#description${id}`).text(disorderHTML()).append('<p><button type="button" class="btn btn-primary" id="seeStories">New Story</button></p>')
// }



class Disorder {
  constructor(obj){
    this.id = obj.id
    this.name = obj.attributes.name
    this.description = obj.attributes.description
    this.narrative = obj.attributes.user_disorders
// obj.attributes.user_disorders[0].narrative
  }
}

Disorder.prototype.disorderHTML = function() {
  let disorderUserDisorders = this.narrative.map(user_disorder => {
    return (`<p>${user_disorder.narrative}</p>
`)
  }).join('')
  return (`
    <div class='disorder'>
    <p>${this.description}</p>
     <p>${disorderUserDisorders}</p>

    </div>
    `)
}
