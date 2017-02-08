class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include Storext.model
  # 'settings' matches my database column
  store_attributes :settings do
    ex_freq String
    ex_time String
    ex_type String
    public Boolean, default: true
    setup Boolean, default: false
  end
end
