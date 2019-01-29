disorder_list = [
  [ "Sexual Assault"],
  [ "Domestic Violence"],
  [ "Child Maltreatment"],
  [ "War-related Trauma"],
  [ "School and Community Violence"],
  [ "Medical Trauma"],
  [ "Traumatic Loss"],
  [ "Natural Disasters"],
]

disorder_list.each do |name|
  Disorder.create( name: name )
end
