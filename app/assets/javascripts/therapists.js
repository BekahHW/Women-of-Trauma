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

  addNewTherapist()

});
}

init()

function addNewTherapist(){
  $('#new_therapist').on('submit', function(event) {
    url = this.action
    console.log(url)
    data = {
      'authenticity_token' :  $("input[name='authenticity_token']").val(),
      'therapist': {
        'name': $("#therapist_name").val(),
        'location': $("#therapist_location").val(),
        // 'phone_number': $("#therapist_phone_number").val()
      }
      }
      console.log(data)

      $.ajax({
        type: "POST",
        url: url,
        data: data,
        success: function(response){
          let name= response.data.attributes.name
          let location= response.data.attributes.location
          // let phone = response.data.attributes.phone_number

          debugger
            $("#name").append(name);
            $("#location").append(location);
            // $("#phone").append(phone);

          // $("#therapist").append("<h1>name</h1>", location, phone);
// And add a button to see all therapists(index)

        }
      })

event.preventDefault()

}
)}
