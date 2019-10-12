class PersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :middle_name, :full_name, :sex

  has_many :declensions
end
