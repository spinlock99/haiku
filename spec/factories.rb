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

Factory.define :micropost do |micropost|
  micropost.line0 "Foo bar"
  micropost.line1 "sucka"
  micropost.line2 "fool"
  micropost.association :user
end
