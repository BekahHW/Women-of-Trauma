-Does it make sense to add a nested form (user_therapist) to therapist form
that does a rating and user comments?

-therapist/show all the therapists by location
  -sort by state
  -state should appear once, and therapists for the state should appear below
  -average rating should appear next to therapist
  -if a therapist's rating is < 3, rating should appear red.



  DATA MAP
  -Each type of trauma appears as a different color on the map. When clicked, users
  from a 100mi area appear on users/index?
  -chat function



therapists -> has_many user_therapsit, :users through user_therapist
1 Dr. Tom    NYC

therapist_ratings
therapist_id   user_id score
1                1       5
1                1       1
1               3         2

therapist_comments
therapist_id user_id   comment

user_therapists
therapist_id user_id    referral_user_id
1              1               3
1              3

users
1 Avi
2 Grace
3 Karlie

Avis Dr is Dr Tom
Karlies Dr is Dr Tom

Avi wants to rate Dr Tom a 5
Karlie wants to rate Dr Tom a 4
Grace can't rate Dr Tom because she isn't a patient

specialties
id      name
1       additction
2       behavorial

therapist_specialties
therapist_id    specialty_id
1                  1
2                  1
3                  2

therpist_locations
1          1
1          2

locations
id    name
1     NYC
2     Boston

Dr tom specializes in addiction
Dr Ruth specializes in addiction
Dr Ruth specializes in adhd

Avi wants to recommend Dr Tom to Grace








5
4                           x
3                  x        x
2          x       x        x
1   x      x       x        x
    A      B       c        D
