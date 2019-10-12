class PersonDeclension < ApplicationRecord
  CASES = %w[genitive dative accusative instrumental prepositional].freeze
  belongs_to :person
  
end
