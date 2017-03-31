class User < ApplicationRecord
  has_and_belongs_to_many :sports
  has_and_belongs_to_many :goals
  has_and_belongs_to_many :gyms

  accepts_nested_attributes_for :sports

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search(search)
   if search
     #eager_load(:sports).joins(:sports).where("sports.name ILIKE ?", "%#{search}%")
     joins(:sports).where("first_name ILIKE :search OR sports.name ILIKE :search", search: "%#{search}%")
   else
     #all.eager_load(:sports)
     all
   end
  end


 # Adding enumeration values for gender and postgresql
 # enum gender: {
 #   Male:                   'Male',
 #   Female:                 'Female',
 #   Other:                  'Other'
 # }

  # include Storext.model
  # # 'settings' matches my database column
  # store_attributes :settings do
  #   public Boolean, default: true
  #   setup Boolean, default: false
  # end
end
