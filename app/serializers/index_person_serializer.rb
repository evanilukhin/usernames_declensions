class IndexPersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :middle_name, :full_name, :sex
end
