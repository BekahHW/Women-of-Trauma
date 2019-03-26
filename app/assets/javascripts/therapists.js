// let therapistData = null

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
//
function allTherapists(id){
  $(function() {
    $.ajax( {
      url: 'http://localhost:3000/therapists',
      method: 'get',
      dataType: 'json',
    }).done(function(data){
      // console.log(data)
      therapistData = data.data



therapistData.map(therapist => {
  const newTherapist = new Therapist(therapist)
  // const newTherapistHtml =
   newTherapist.therapistHTML()
  // document.getElementById('ajax-posts').innerHTML += newTherapistHtml
// })
// })
// })
//
//
//
//       // let newTherapist = new Therapist(therapistData[id])
//       // let newTherapistHTML =  newTherapist.therapistHTML()
//       // forEach(therapist => {
//       //
//       //   let all_user_therapists =
//       //   `
//       //     <div class='all_therapists'>
//       //        <h3> ${therapist.attributes.name}</h3>
//       //         <p> ${therapist.attributes.location}</p>
//       //        </div>
//       //      `
// 			// 	document.getElementById('therapist').innerHTML += all_user_therapists
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
