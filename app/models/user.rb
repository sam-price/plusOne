class User < ApplicationRecord

# User setup and associations. Large file as pretty much everything is based around the users
# in this application

  belongs_to :city
  belongs_to :workout
  belongs_to :fitness_level
  belongs_to :moment

  has_and_belongs_to_many :sports
  has_and_belongs_to_many :goals
  has_and_belongs_to_many :gyms

  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy

  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  accepts_nested_attributes_for :gyms, :allow_destroy => true

  enum gender: { male: 0, female: 1, other: 2}

# Using Postgres full-text search for searching across multiple columns
# in this example covering my first_name & last_name columns in one search
  include PgSearch
  pg_search_scope :quick_search, against: [:first_name, :last_name], using: {tsearch: {dictionary: "english"}},
  associated_against: {city: :name, fitness_level: :name, gyms: :name, sports: :name, goals: :name }
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



end
