describe Api::V1::PeopleController do
  describe 'DELETE #destroy' do
    let!(:person) { create(:person) }

    describe 'with valid person params' do
      before(:each) do
        delete :destroy, params: { id: person.id }
      end

      it 'returns success' do
        expect(response).to have_http_status(:no_content)
      end

      it 'really destroys object' do
        expect { person.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
