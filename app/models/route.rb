class Route < ApplicationRecord
  has_and_belongs_to_many :railway_stations

  validates :name, presence: true

  before_create :set_name

  private

  def set_name
    return unless name.present?

    name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

end
