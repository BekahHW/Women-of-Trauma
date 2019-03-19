let therapistDataStore = null

window.init = function() {
$(function() {
  $.ajax( {
    url: 'http://localhost:3000/therapists/new',
    method: 'get',
    dataType: 'json',
  }).done(function(data){
    therapistDataStore = data.data
  })

  listenForTherapistClick()

});
}

init()

function listenForTherapistClick(){
  $('#new_therapist').on('submit', function(event) {
    url = this.action
    console.log(url)

    data = {
      'authenticity_token' :  $("input[name='authenticity_token']").val(),
      'new_therapist': {
        'name': $("therapist_name").val(),
        'location': $("therapist_location").val(),
        'phone_number': $("therapist_phone_number").val()
      }
      }
      console.log(data)
debugger

    event.preventDefault()
})
}

function getTherapistForm(id){

}
