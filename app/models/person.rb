# Store information about user, full_name generates automatically in callbacks. Ever
class Person < ApplicationRecord
  has_many :person_declensions

  validates :first_name, :full_name, presence: true
  validates :sex, inclusion: { in: %w[male female] }

  before_validation do
    self.full_name = [last_name, first_name, middle_name].compact.join(' ')
  end
end
