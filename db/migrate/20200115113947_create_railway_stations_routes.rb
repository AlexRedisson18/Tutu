# frozen_string_literal: true

class CreateRailwayStationsRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :railway_stations_routes do |t|
      t.references :railway_station
      t.references :route
    end
  end
end
