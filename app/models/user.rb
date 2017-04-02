class User < ApplicationRecord
  belongs_to :city
  has_and_belongs_to_many :sports
  has_and_belongs_to_many :goals
  has_and_belongs_to_many :gyms

  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy

  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  accepts_nested_attributes_for :sports
  accepts_nested_attributes_for :city

# Using Postgres full-text search for searching across multiple columns
# in this example covering my first_name & last_name columns in one search
  include PgSearch
  pg_search_scope :quick_search, against: [:first_name, :last_name], using: {tsearch: {dictionary: "english"}},
  associated_against: {sports: :name, goals: :name, }
  scope :sorted, ->{ order(first_name: :asc) }
  

  def self.perform_search(keyword)
    if keyword.present?
      User.quick_search(keyword)
    else
      User.all
    end.sorted
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

###################
## Friendship Types
###################
  def request_friendship(user_2)
 	  self.friendships.create(friend: user_2)
  end

  def pending_friend_requests_to
    self.friendships.where(state: 'pending')
  end

  def pending_friend_requests_from
    self.inverse_friendships.where(state: 'pending')
  end

  def active_friends
    self.friendships.where(state: 'active').map(&:friend) + self.inverse_friendships.where(state: 'active').map(&:user)
  end

  def friendship_status(user_2)
    friendship = Friendship.where(user_id: [self.id, user_2.id], friend_id: [self.id, user_2.id])
    unless friendship.any?
      return 'not_friends'
    else
      if friendship.first.state == 'active'
        return 'friends'
      else
        if friendship.first.user == self
            return 'pending'
          else
            return 'requested'
        end
      end
    end
  end

  def friendship_relation(user_2)
    Friendship.where(user_id: [self.id, user_2.id], friend_id: [self.id, user_2.id]).first
  end

###################
## Basic Search Method
###################
  # def self.search(search)
  #  if search
  #    #eager_load(:sports).joins(:sports).where("sports.name ILIKE ?", "%#{search}%")
  #    joins(:sports).where("first_name ILIKE :search OR sports.name ILIKE :search", search: "%#{search}%").distinct
  #  else
  #    #all.eager_load(:sports)
  #    all
  #  end
  # end


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
