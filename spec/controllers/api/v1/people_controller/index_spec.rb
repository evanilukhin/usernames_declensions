describe Api::V1::PeopleController do
  describe 'GET #index' do
    let!(:first_person) { create(:person) }
    let!(:second_person) { create(:person_woman) }

    before do
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns only two objects' do
      expect(JSON.parse(response.body).count).to eq(2)

    it 'returns correct objects' do
      first_json = IndexPersonSerializer.new(first_person).as_json.deep_stringify_keys
      second_json = IndexPersonSerializer.new(second_person).as_json.deep_stringify_keys
      expect(JSON.parse(response.body)).to contain_exactly(first_json, second_json)
    end
  end
end
