class Route < ApplicationRecord
  has_many :railway_stations_route
  has_many :railway_stations, through: :railway_stations_route

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    errors.add(:base, 'Route should contain at least 2 stations') if railway_stations.size < 2
  end
end
