# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                   "Lars-Olof Moilanen"
  user.email                  "lars.olof.moilanen@gmail.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end