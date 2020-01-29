class Route < ApplicationRecord
  validates :name, presence: true
  has_many :railway_stations_routes
  has_and_belongs_to_many :railway_stations
end
