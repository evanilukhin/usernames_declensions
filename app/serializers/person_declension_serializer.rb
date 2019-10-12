class PersonDeclensionSerializer < ActiveModel::Serializer
  attributes :id, :person_id, :name_case, :first_name, :last_name, :middle_name, :full_name
  belongs_to :person
end
