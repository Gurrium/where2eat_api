require 'rails_helper'

RSpec.describe 'RestaurantsController' do
  describe 'GET /restaurants' do
    it 'also returns restaurants data' do
      is_expected.to eq 200

      expect(json[0]).to have_key('gurunavi_id')
      expect(json[0]).to have_key('name')
      expect(json[0]).to have_key('image_url')
    end
  end

  describe 'GET /restaurants/:areacode_s' do
    context 'when :areacode_s exists' do
      let(:areacode_s) { 'AREAS2818' }

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

    context 'when :areacode_s does not exist' do
      include_examples 'returns 404'
    end
  end
end
