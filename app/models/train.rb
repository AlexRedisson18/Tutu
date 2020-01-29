class Train < ApplicationRecord
  validates :number, presence: true,
                    length: { minimum: 2 }
  belongs_to :current_station, class_name: 'RailwayStation', optional: true
end
