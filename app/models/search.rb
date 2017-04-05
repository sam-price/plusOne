class Search < ApplicationRecord
# advanced search method that is called by the controller and views  
  def search_users
    users = User.all
    users = users.joins(:sports).where("sports.name ILIKE ?", "%#{sports}%") if sports.present?
    users = users.joins(:goals).where("goals.name ILIKE ?", "%#{goals}%") if goals.present?
    users = users.joins(:city).where("cities.name ILIKE ?", "%#{cities}") if cities.present?
    return users
  end
end
