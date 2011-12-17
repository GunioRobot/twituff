class User < ActiveRecord::Base
  # Authlogic love which automatically handles password encryption, token generation and a hand full of other features.
  acts_as_authentic

  #Campos não podem ser nulos.
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :name

  #Campos com valores únicos
  validates_uniqueness_of :email

end
