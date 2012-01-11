# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Marianna Milesi"
  user.email                 "mm00128@surrey.ac.uk"
  user.password              "surrey"
  user.password_confirmation "surrey"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "Still pooping."
  micropost.association :user
end
