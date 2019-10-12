describe Api::V1::PeopleController do
  describe 'POST #create' do
    describe 'with valid person params' do
      before(:each) do
        post :create, params: { person: { first_name: 'Анатолий' } }
      end

      it 'returns success' do
        expect(response).to have_http_status(:success)
      end

      it 'creates object in database' do
        expect(Person.find(JSON.parse(response.body)['id'])).to be_present
      end
    end

    describe 'with wrong params' do
      before(:each) do
        post :create, params: { person: { first_name: 'Анатолий', sex: 'pineapple' } }
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
