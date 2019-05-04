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

  describe 'GET /restaurants/:id' do
    context 'when :id exists' do
      let(:id) { 'gddb600' }

      it 'also returns the restaurant detail' do
        is_expected.to eq 200

        expect(json).to have_key('name')
        expect(json).to have_key('address')
        expect(json).to have_key('phone_number')
        expect(json).to have_key('url')
        expect(json).to have_key('image_url')
      end
    end

    context 'when :id does not exist' do
      let(:id) { 'aaaa000' }

      it { is_expected.to eq 404 }
    end
  end
end
