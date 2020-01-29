class RailwayStation < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 2 }
  has_many :trains, foreign_key: :current_station_id
  has_and_belongs_to_many :routes
end
