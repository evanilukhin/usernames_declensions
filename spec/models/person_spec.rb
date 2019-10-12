describe 'Person' do
  context 'create' do
    let(:person) { create(:person, first_name: 'Илья', last_name: 'Ильясов', middle_name: 'Михайлович', sex: 'male') }

    it 'initializes correct full_name' do
      expect(person.full_name).to eq('Ильясов Илья Михайлович')
    end

    it 'creates 5 declensions' do
      expect(person.declensions.count).to eq(5)
    end
  end

  context 'update' do
    let(:person) { create(:person, first_name: 'Сергей', last_name: 'Ким', middle_name: 'Анатольевич', sex: 'male') }

    before(:each) do
      person.update(first_name: 'Иван')
    end

    it 'changes full name' do
      expect(person.full_name).to eq('Ким Иван Анатольевич')
    end

    it 'does not change declensions count' do
      expect(person.declensions.count).to eq(5)
    end

    it 'changes declensions' do
      expect(person.declensions.pluck(:first_name)).to contain_exactly('Ивана', 'Ивану', 'Иваном', 'Иване', 'Ивана')
    end
  end

  context 'destroy' do
    let(:person) { create(:person) }

    it 'removes declensions' do
      declensions_ids = person.declensions.pluck(:id)
      person.destroy
      expect(PersonDeclension.where(id: declensions_ids).count).to eq(0)
    end
  end
end
