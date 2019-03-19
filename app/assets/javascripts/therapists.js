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
  $('#new_therapist').on('submit', function(event) {
    url = this.action
    console.log(url)

    data = {
      'authenticity_token' : { $("input[name='authenticity_token']").val(),
      'therapist': {
        name: $("therapist_name").val(),
        location: $("therapist_location").val(),
        phone_number: $("therapist_phone_number").val()

      }

      }
    }
    event.preventDefault()
    let id = $(this).attr('id')
    console.log("You've clicked a therapist")
    getTherapistForm(id)
})
}

function getTherapistForm(id){

}
