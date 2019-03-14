# disorder_list = [
#    "Sexual Assault",
#    "Domestic Violence",
#    "Child Maltreatment",
#    "War-related Trauma",
#    "School and Community Violence",
#    "Medical Trauma",
#    "Traumatic Loss",
#    "Natural Disasters",
# ]
#
# disorder_list.each do |name|
#   Disorder.create( name: name )
# end


Disorder.create(name: 'Natural Disasters', description: 'Any natural catastrophe (e.g., tornadoes, hurricanes, and earthquakes) that causes enough damage that local, state, or federal agencies and disaster relief organizations are called into action.')

Disorder.create(name: 'Traumatic Loss', description: 'Traumatic loss or grief can occur following a death of someone important to a child or adult. The death is typically sudden and unexpected.')

Disorder.create(name: 'Medical Trauma', description: 'Children may show traumatic reactions to medical conditions, invasive medical procedures, or treatments that are frightening or cause pain, injury, and/or serious illness.')

Disorder.create(name: 'School and Community Violence', description: 'School and community violence include predatory violence or personal conflicts between people who are not family members (e.g., shootings, rape, robbery).')


Disorder.create(name: "War-related Trauma", description: "Refugee and warzone trauma. Terrorism. Combat-related trauma.")

Disorder.create(name: "Sexual Assault", description: "Sexual assault involves any unwanted and involuntary sexual behavior towards a person. The victim is forced or coerced engage in an act against their will in a non-consensual setting. Sexual assault can include rape, groping, forced kissing, and any other sort of harassment or abuse in a sexual context.")

Disorder.create(name: "Domestic Violence", description: "Domestic violence is classified as actual or threatened physical violence, sexual violence, and/or emotional abuse between adults in an intimate relationship.")

Disorder.create(name: "Child Maltreatment", description: "Neglect. Physical abuse. Mental abuse. Maltreatment. Sexual Abuse." )


User.create(name: "Bekah", location: "Ohio")
User.create(name: "Jesse", location: "WV")
User.create(name: "Zach", location: "PA")



UserDisorder.create(disorder_id: 1, user_id: 1, narrative: "Sexual Assault. If there are, we all be dead. Well, I'm not saying I'd like to build a summer home here, but the trees are actually quite lovely. And YOU: friendless, brainless, helpless, hopeless! Do you want me to send you back to where you were? Unemployed, in Greenland? No, there is too much. Let me sum up. Buttercup is marry' Humperdinck in a little less than half an hour. So all we have to do is get in, break up the wedding, steal the princess, make our escape... after I kill Count Rugen. You seem a decent fellow... I hate to kill you. Naturally... but I find that Thibault cancels out Capa Ferro. Don't you?")

UserDisorder.create(disorder_id: 2, user_id: 2, narrative: "Domestic Violence. You have a great gift for rhyme. Well, is only way I can be satisfied. If I use my right... over too quickly. I do not mean to pry, but you don't by any chance happen to have six fingers on your right hand? You only think I guessed wrong! That's what's so funny! I switched glasses when your back was turned! Ha ha! You fool! You fell victim to one of the classic blunders - The most famous of which is never get involved in a land war in Asia - but only slightly less well-known is this: Never go against a Sicilian when death is on the line! Ha ha ha ha ha ha ha! Ha ha ha ha ha ha ha! Ha ha ha.")

UserDisorder.create(disorder_id: 3, user_id: 3, narrative: "Child Maltreatment. Fuss, fuss... I think he like to scream at *us*. Don't worry, I won't let it go to my head. It's possible. I kill a lot of people. Oh, the sot has spoken. What happens to her is not truly your concern. I will kill her. And remember this, never forget this: when I found you, you were so slobbering drunk, you couldn't buy Brandy! Hear this now: I will always come for you. Unless the enemy has studied his Agrippa... which I have.
")
