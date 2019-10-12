describe Api::V1::PeopleController do
  describe 'GET #show' do
    let!(:person) { create(:person) }

    it 'returns success' do
      get :show, params: { id: person.id }
      expect(response).to have_http_status(:success)
    end

    it 'returns correct object' do
      get :show, params: { id: person.id }
      expect(JSON.parse(response.body)).to eq(PersonSerializer.new(person).as_json.deep_stringify_keys)
    end

    it 'returns empty body unless find object' do
      get :show, params: { id: Person.maximum(:id) + 1 }
      expect(response.body).to eq('')
    end

    it 'returns 404 unless find object' do
      get :show, params: { id: Person.maximum(:id) + 1 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
