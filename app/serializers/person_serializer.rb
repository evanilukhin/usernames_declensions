class PersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :middle_name, :full_name
  attribute(:sex) { I18n.t(object.sex || 'undefined', scope: 'sex', locale: :ru) }

  has_many :declensions
end
