class Event < ApplicationRecord

  # dependance

  has_many :participations
  has_many :users, through: :participations
  belongs_to :user

  #validation

  #validates :start_date, presence: true, date_cannot_be_in_the_past: true
  #validates :duration, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}

  validates :title, presence: true, length: { in: 3..140 }
  validates :description, presence: true, length: { in: 10..10000 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
  validates :location, presence: true

  #multiple de 5
  def is_a_multiple_of_5
   if (duration >0)
     if (duration%5) == 0
    else
      errors.add(:duration, "multiple of 5")
     end
   end
  end

  def date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:expiration_date, "can't be in the past")
      return false
    end
    return true
  end

end
