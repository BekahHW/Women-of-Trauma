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
  clickAllTherapists()
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

            $("#name").append(name);
            $("#location").append(location);

            $("#therapist_name").val("")
            $("#therapist_location").val("")

            // $("#phone").append(phone);

          // $("#therapist").append("<h1>name</h1>", location, phone);
// And add a button to see all therapists(index)

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
        debugger
				// const newTherapist = new Therapist(therapist)
				const newTherapistHtml = newTherapist.therapistHTML()
				document.getElementById('#therapist').innerHTML += newTherapistHtml
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

  Therapist.prototype.therapistHTML = function() {
debugger
// this is only getting the submitted therapist. Need to access all therapists
    let therapist = this.forEach(therapist => {
      return (`<p>${therapist.name}</p>
        <p>${therapist.location}</p>
  `)
    }).join('')
    return
    debugger
(`
      <div class='disorder'>
      <p>${this.description}</p>
       <p>${disorderUserDisorders}</p>

      </div>
      `)
  }
