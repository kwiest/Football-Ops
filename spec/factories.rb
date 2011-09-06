Factory.define :user do |a|
  a.first_name { Faker::Name.first_name }
  a.last_name { Faker::Name.last_name }
  a.email { Faker::Internet.email }
  a.password 'secret'
  a.password_confirmation 'secret'
  a.school factory: :school
end

Factory.define :conference do |a|
  a.name "Pac-12"
end

Factory.define :district do |a|
  a.name "District 9"
end

Factory.define :division do |a|
  a.name "FBS"
end

Factory.define :job do |a|
  a.user factory: :user
  a.title "Director of Football Ops"
  a.category "Full time"
  a.school "UofO"
  a.location "Eugene, OR"
  a.description "A GREAT gig!"
  a.apply "email me"
end

Factory.define :school do |a|
  a.name { Faker::Company.name }
  a.conference factory: :conference
  a.division factory: :division
  a.district factory: :district
end