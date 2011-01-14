# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Andrew Dixon"
  user.email                 "dixon@atomicbroadcast.net"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.sequence :name do |n|
  "name-#{n}"
end

Factory.define :micropost do |micropost|
  micropost.line0 "line0"
  micropost.line1 "line1"
  micropost.line2 "line2"
  micropost.association :user
end
