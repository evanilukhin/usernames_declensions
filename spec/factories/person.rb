FactoryBot.define do
  factory :person, class: Person do
    first_name { 'Иван' }
    last_name { 'Иванов' }
    middle_name { 'Иванович' }
    sex { 0 }
  end
end
