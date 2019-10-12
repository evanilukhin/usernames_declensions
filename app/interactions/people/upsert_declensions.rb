module People
  class UpsertDeclensions < ActiveInteraction::Base
    object :person

    delegate :id, :first_name, :last_name, :middle_name, :created_at, :updated_at, :sex, to: :person

    def execute
      upserted_data = PersonDeclension::CASES.map(&method(:declension))
      PersonDeclension.upsert_all(upserted_data, unique_by: %i[person_id name_case])
    end

    private

    def declension(name_case)
      person_case = person_case(name_case)
      {
        person_id: id,
        name_case: name_case,
        first_name: person_case.firstname,
        last_name: person_case.lastname,
        middle_name: person_case.middlename,
        full_name: person_case.to_s,
        created_at: created_at || Time.now.utc,
        updated_at: Time.now.utc
      }
    end

    def person_case(name_case)
      Petrovich(
        firstname: first_name,
        lastname: last_name,
        middlename: middle_name,
        gender: sex
      ).to(name_case.to_sym)
    end
  end
end
