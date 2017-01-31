require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe '#create' do
    context 'with valid data' do
      it 'returns created' do
        post :create, params: {entity_type: :foo, entity_id: :bar, tags: [:one, :two]}
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid data' do
      it 'returns an error' do
        pending('actually do parameter validation')
        post :create, params: {entity_type: :foo, entity_id: :bar, tags: {one: :two}}
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
