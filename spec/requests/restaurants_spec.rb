require 'rails_helper'

RSpec.describe 'RestaurantsController' do
  describe 'GET /restaurants' do
    include_examples 'returns 200' do
      it 'also returns restaurants data' do
        expect(json).to have_key(:id)
        expect(json).to have_key(:name)
        expect(json).to have_key(:image_url)
      end
    end
  end

  describe 'GET /restaurants/:id' do
    context ':id is exist' do
      include_examples 'returns 200' do
        it 'also returns the restaurant detail' do
          expect(json).to have_key(:name)
          expect(json).to have_key(:address)
          expect(json).to have_key(:phone_number)
          expect(json).to have_key(:url)
          expect(json).to have_key(:image_url)
        end
      end
    end

    context ':id is not exist' do
      include_examples 'returns 404'
    end
  end
end
