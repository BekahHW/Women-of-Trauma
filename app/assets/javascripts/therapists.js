let therapistDataStore = null

window.init = function() {
$(function() {
  $.ajax( {
    url: 'http://localhost:3000/therapist',
    method: 'get',
    dataType: 'json',
  }).done(function(data){
    therapistDataStore = data.data
  })

  listenForTherapistClick()

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
