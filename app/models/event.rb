class Event < ApplicationRecord

  # dependance

  has_many :participations
  has_many :users, through: :participations
  belongs_to :user

  #validation

  validates :start_date, presence: true
  validate :date_cannot_be_in_the_past
  validates :duration, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validate :divisible_by_five

  validates :title, presence: true, length: { in: 3..140 }
  validates :description, presence: true, length: { in: 10..10000 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
  validates :location, presence: true


  def divisible_by_five
      if (self.duration % 5) != 0
        self.errors[:base] << "Number must be divisible by 5!"
      end
  end

  def date_cannot_be_in_the_past
    if self.start_date.present? && self.start_date < Date.today
      self.errors[:base] << "Date must be in the futur"
    end
  end





end
