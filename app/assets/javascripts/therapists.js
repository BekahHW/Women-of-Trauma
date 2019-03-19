let globalDataStore = null
let userId

window.init = function() {
$(function() {
  $.ajax( {
    url: 'http://localhost:3000/users/welcome',
    method: 'get',
    dataType: 'json',
  }).done(function(data){
    globalDataStore = data.data
  })
  listenForTherapistClick()
  fetch('http://localhost:3000/users/welcome.json')
  .then(data => data.json())
  .then(data => {
    userId = data.data.id})
});
}

init()

function listenforTherapistClick(){
  e.preventDefault()
  console.log("You've clicked a therapist")
}
