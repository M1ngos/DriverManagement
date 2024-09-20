class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

# def self.find_for_database_authentication(conditions)
#   conditions[:email] ? where(email: conditions[:email]).first : nil
# end