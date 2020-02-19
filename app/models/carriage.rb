class Carriage < ApplicationRecord
  belongs_to :train, optional: true
  validates :number, :top_seats, :bottom_seats, presence: true
  validates :number, uniqueness: { scope: :train_id }, if: :train_id
  validates :number, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  before_validation :set_number, if: :train_id, on: :create

  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :coupe, -> { where(type: 'CoupeCarriage') }
  scope :ordered, -> { order(:number) }

  private

  def set_number
    self.number = train.carriages.count + 1
  end
end
