class PersonDeclensionSerializer < ActiveModel::Serializer
  attributes :id, :person_id, :first_name, :last_name, :middle_name, :full_name
  attribute(:name_case) { I18n.t(object.name_case, scope: 'name_case', locale: :ru) }

  belongs_to :person
end
