class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', optional: true

  validates :number, presence: true,
                    length: { minimum: 2 }

end
