//$(function(){
  //console.log('it works`')
//})
let globalDataStore = null
let userId
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

  fetch('http://localhost:3000/users/welcome.json')
  .then(data => {
console.log(data)
    userId = data.json()})
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

      handleForm()

}

const handleForm = () => {
  $(`.storyFormBtn`).click(function() {
    event.preventDefault()

    textareaVal = $(this).parent('form').children('.form-group').children('textarea').val()

    const formVal = {
        narrative: textareaVal,
        user_id: '1',
        disorder_id: $(this).attr('disorder_id')

    }

    var formData = new FormData();
    console.log("In post request")
    formData.append('user_disorder',  JSON.stringify(formVal))

    const token = $('meta[name="csrf-token"]').attr('content')
    fetch(`http://localhost:3000/user_disorders`
      , {
    method: 'POST',
    credentials: 'include',
    headers: {
      // 'X-Requested-With': 'XMLHttpRequest',
      'X-CSRF-Token': token,
      //
      'Content-Type': 'application/json',
      //         'Accept': 'application/json'

  // 'X-CSRF-Token': '<%= form_authenticity_token.to_s %>'

    },

    body: formData}
  )
  .then(response => response.json())
.catch(error => console.error('Error:', error))
.then(response => console.log('Success:', JSON.stringify(response)));
  })
}



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
