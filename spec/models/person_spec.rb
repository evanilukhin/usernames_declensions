describe 'Person' do
  context 'create' do
    let(:person) { create(:person, first_name: 'Илья', last_name: 'Ильясов', middle_name: 'Михайлович', sex: 'male')}

    it 'initialize correct full_name' do
      expect(person.full_name).to eq('Ильясов Илья Михайлович')
    end
  end
end
