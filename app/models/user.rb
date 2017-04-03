class User < ApplicationRecord
  has_and_belongs_to_many :sports
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 # Adding enumeration values for gender and postgresql
 # enum gender: {
 #   Male:                   'Male',
 #   Female:                 'Female',
 #   Other:                  'Other'
 # }

end
