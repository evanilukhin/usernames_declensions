FactoryBot.define do
  factory :person, class: Person do
    first_name { 'Сергей' }
    last_name { 'Ильясов' }
    middle_name { 'Михайлович' }
    sex { nil }
  end

  factory :person_woman, parent: :person do
    first_name { 'Инна' }
    last_name { 'Михайло' }
    middle_name { 'Сергеевна' }
    sex { 'female' }
  end
end
