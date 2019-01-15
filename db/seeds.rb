# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
  :user_keys =>
    ["name", "location", "email"],
  :users => [
    ["Bekah", "Steubenville", "bekah@bekah.com"],
    ["Lisa", "Houston", "Lisa@lisa.com"],
    ["Sarah", "Pittsburgh", "sarah@sarah.com"],

  ],
  :disorder_keys =>
   ["name", "description"],
  :disorders => [
    ["PTSD", "Post-traumatic stress disorder (PTSD) is a mental health condition that's triggered by a terrifying event — either experiencing it or witnessing it. Symptoms may include flashbacks, nightmares and severe anxiety, as well as uncontrollable thoughts about the event."],
    ["Anxiety", "When panic and anxiety symptoms escalate into anxiety attacks and panic attacks, it may be an anxiety disorder. Anxiety disorders include generalized anxiety disorder, social anxiety, and panic disorder. Anxiety attacks and panic attack symptoms can be treated with medication and therapy."],
    ["Depression", "Depression is a mood disorder that causes a persistent feeling of sadness and loss of interest. Also called major depressive disorder or clinical depression."],

  ],
  :user_disorder_keys =>
    ["narrative"],
  :user_disorders => [
    ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."],
    ["Now it's beginning to make a little sense. You have freedom here. The only guide is your heart. I guess I'm a little weird. I like to talk to trees and animals. That's okay though; I have more fun than most people. They say everything looks better with odd numbers of things. But sometimes I put even numbers—just to upset the critics. We don't need any guidelines or formats. All we need to do is just let it flow right out of us. It's beautiful - and we haven't even done anything to it yet.
"],
    ["Play with the angles. Steve wants reflections, so let's give him reflections. Mountains are so simple, they're hard. Let's have a little bit of fun today. You can spend all day playing with mountains. These things happen automatically. All you have to do is just let them happen."],

  ],
}

def main
  # make_users
  make_disorders
  make_userdisorders
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_disorders
  DATA[:disorders].each do |disorder|
    new_disorder = Disorder.new
    disorder.each_with_index do |attribute, i|
      new_disorder.send(DATA[:disorder_keys][i] + "=", attribute)
    end
    new_disorder.users.each {|c| c.save}
    new_disorder.save
  end
end

def make_user_disorders
  DATA[:user_disorders].each do |user_disorder|
    new_user_disorder = UserDisorder.new
    user_disorder.each_with_index do |attribute, i|
      new_user_disorder.send(DATA[:user_disorder_keys][i] + "=", attribute)
    end
    new_user_disorder.users.each {|c| c.save}
    new_user_disorder.save
  end
end

main
