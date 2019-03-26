
$(function() {
  addNewTherapist()
  clickAllTherapists()
});

function addNewTherapist(){
  $('#new_therapist').on('submit', function(event) {
    // url looks at the action on the form
    url = this.action
    data = {
      'authenticity_token' :  $("input[name='authenticity_token']").val(),
      'therapist': {
        'name': $("#therapist_name").val(),
        'location': $("#therapist_location").val(),
      }
      }

      $.ajax({
        type: "POST",
        url: url,
        data: data,
        success: function(response){
          let new_therapist = `
          <h3>${response.data.attributes.name}</h3>
          <p>${response.data.attributes.location}</p>`

            $("#therapist").append(new_therapist);
            // Clear the value of form
            $("#therapist_name").val("")
            $("#therapist_location").val("")
        }
      })
// Prevents from default behavior, which would take you to new page
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
      therapistData = data.data

      therapistData.map(therapist => {
        // call new Therapist
        const newTherapist = new Therapist(therapist)

        // call prototype method on newTherpist to add content for each therapist on index list
         newTherapist.therapistHTML()
    })
  });
  }
)}
//
  function Therapist (id, name, location) {
      this.id = id
      this.name = id.attributes.name
      this.location = id.attributes.location
  }



  Therapist.prototype.therapistHTML = function() {
let all_user_therapists =
  `
    <div class='all_therapists'>
       <h3> ${this.name}</h3>
        <p> ${this.location}</p>
       </div>
     `
	document.getElementById('therapist').innerHTML += all_user_therapists
  }
