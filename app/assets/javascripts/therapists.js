let therapistDataStore = null
let aUserId

window.init = function() {
$(function() {
  $.ajax( {
    url: 'http://localhost:3000/users/welcome',
    method: 'get',
    dataType: 'json',
  }).done(function(data){
    therapistDataStore = data.data
  })

  listenForTherapistClick()

  fetch('http://localhost:3000/users/welcome.json')
  .then(data => data.json())
  .then(data => {
    aUserId = data.data.id})
});
}

init()

function listenforTherapistClick(){
  $('#therapist_button').on('click', function(event) {
    event.preventDefault()
    let id = $(this).attr('id')
    console.log("You've clicked a therapist")
    getTherapistForm(id)
})
}

function getTherapistForm(id){

}
