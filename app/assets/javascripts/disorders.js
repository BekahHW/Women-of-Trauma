//$(function(){
  //console.log('it works`')
//})
let globalDataStore = null
let userId
// window.init = function() {
$(function() {
  $.ajax( {
    url: 'http://localhost:3000/disorders',
    method: 'get',
    dataType: 'json',
  }).done(function(data){
    globalDataStore = data.data
  })
  listenForClick()

  fetch('http://localhost:3000/users/welcome.json')
  .then(data => data.json())
  .then(data => {
    userId = data.data.id})
});
// }
//
// init()

function listenForClick(){
  $('.disorder_link').on('click', function(event) {
    event.preventDefault()
    let id = $(this).attr('id')
    getDisorderShow(id)
  })
}


function getDisorderShow(id){
  let newDisorder = new Disorder(globalDataStore[id - 1])

  let newDisorderHTML = newDisorder.disorderHTML()
  $(`#description${newDisorder.id}`).html(newDisorderHTML).append('<p><button type="button" class="btn btn-primary" id="addStories">Add Story</button></p>')
  addStoryClick(newDisorder.id)
}

function addStoryClick(id){
  $('#addStories').on('click', function(event) {
    event.preventDefault()
    console.log("Stories have been clicked")
    // let id = $(this).attr('id')
    addStoryForm(id)
  })
}

function addStoryForm(id){
    console.log("Stories go here")
let storyForm = (`
  		<strong>New Story Form</strong>
  			<form>
        <div class='form-group'>
        <label for="narrative${id}">Story</label>
        <textarea class="form-control" id='narrative${id}' rows="3"></textarea>

          </div>
          <button type="submit" disorder_id=${id} class="btn btn-primary storyFormBtn">Submit</button>

  			</form>
  		`)

      $(`#description${id}`).html(storyForm)
      // handleForm()

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
    <p>${this.description}</p>
     <p>${disorderUserDisorders}</p>

    </div>
    `)
}
