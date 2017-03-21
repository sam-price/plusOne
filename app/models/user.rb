class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 # Adding enumeration values for gender and postgresql
 enum gender: {
   Male:                   'Male',
   Female:                 'Female',
   Other:                  'Other'
 }

  include Storext.model
  # 'settings' matches my database column
  store_attributes :settings do
    public Boolean, default: true
    setup Boolean, default: false
  end
end
