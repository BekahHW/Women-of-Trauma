
$(function() {
  addNewTherapist()
  clickAllTherapists()
});

function addNewTherapist(){
  $('#new_therapist').on('submit', function(event) {
    url = this.action
    console.log(url)
    data = {
      'authenticity_token' :  $("input[name='authenticity_token']").val(),
      'therapist': {
        'name': $("#therapist_name").val(),
        'location': $("#therapist_location").val(),
      }
      }
      console.log(data)

      $.ajax({
        type: "POST",
        url: url,
        data: data,
        success: function(response){
          let new_therapist = `
          <h3>${response.data.attributes.name}</h3>
          <p>${response.data.attributes.location}</p>`

            $("#therapist").append(new_therapist);

            $("#therapist_name").val("")
            $("#therapist_location").val("")
        }
      })

event.preventDefault()

}
)}

function clickAllTherapists(){
  $('#all_therapists').on('click', function(event) {
    event.preventDefault()
    allTherapists()
}
)}

function allTherapists(){
  $(function() {
    $.ajax( {
      url: 'http://localhost:3000/therapists',
      method: 'get',
      dataType: 'json',
    }).done(function(data){
      console.log(data)
      therapistData = data.data

      therapistData.forEach(therapist => {

        let all_user_therapists =
        `
          <div class='all_therapists'>
             <h3> ${therapist.attributes.name}</h3>
              <p> ${therapist.attributes.location}</p>
             </div>
           `
				document.getElementById('therapist').innerHTML += all_user_therapists
    })
  });
  }
)}

  class Therapist {
    constructor(obj){
      this.id = obj.id
      this.name = obj.attributes.name
      this.location = obj.attributes.location
    }
  }
