# Store information about user, full_name generates automatically in callbacks. Ever
class Person < ApplicationRecord
  has_many :person_declensions, dependent: :destroy

  alias_attribute :declensions, :person_declensions

  validates :first_name, :full_name, presence: true
  validates :sex, inclusion: { in: %w[male female] }, allow_nil: true

  before_validation do
    self.full_name = [last_name, first_name, middle_name].compact.join(' ')
  end

  after_save_commit :upsert_declensions

  private

  # upsert - an operation that inserts rows into a database table if they do not already exist,
  # or updates them if they do.(wiktionary)
  def upsert_declensions
    upserted_data =
      PersonDeclension::CASES.map do |name_case|
        person_case = Petrovich(
          firstname: first_name,
          lastname: last_name,
          middlename: middle_name,
          gender: sex
        ).to(name_case.to_sym)
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

    PersonDeclension.upsert_all(upserted_data, unique_by: %i[person_id name_case])
  end
end
