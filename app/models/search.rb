class Search < ApplicationRecord
  def search_users
    users = User.all
    #users = users.where("first_name ILIKE ?", "%#{keywords}%") if keywords.present?
    users = users.joins(:sports).where("sports.name ILIKE ?", "%#{sports}%") if sports.present?
    users = users.joins(:goals).where("goals.name ILIKE ?", "%#{goals}%") if goals.present?
    users = users.joins(:city).where("cities.name ILIKE ?", "%#{cities}") if cities.present?

    return users
  end
end
