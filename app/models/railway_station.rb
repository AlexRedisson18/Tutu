class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_route
  has_many :routes, through: :railway_stations_route

  validates :title, presence: true,
                    length: { minimum: 2 }

  scope :ordered, -> { joins(:railway_stations_route).order('railway_stations_routes.position').uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route&.update(position: position)
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  protected

  def station_route(route)
    station_route ||= railway_stations_route.where(route: route).first
  end
end
