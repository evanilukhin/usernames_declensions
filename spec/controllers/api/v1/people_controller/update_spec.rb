describe Api::V1::PeopleController do
  describe 'PATCH #update' do
    let!(:person) { create(:person) }

    describe 'with valid person params' do
      before(:each) do
        post :update, params: { id: person.id, person: { sex: 'female' } }
      end

      it 'returns success' do
        expect(response).to have_http_status(:success)
      end

      it 'changes sex' do
        person.reload
        expect(person.sex).to eq('female')
      end

      it 'returns changed object' do
        person.reload
        expect(JSON.parse(response.body)).to eq(PersonSerializer.new(person).as_json.deep_stringify_keys)
      end
    end

    describe 'with wrong params' do
      before(:each) do
        post :update, params: { id: person.id, person: { sex: 'pineapple' } }
      end

      it 'returns a correct error message' do
        expect(JSON.parse(response.body)).to eq('sex' => ['is not included in the list'])
      end

      it 'returns bad_request code' do
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
