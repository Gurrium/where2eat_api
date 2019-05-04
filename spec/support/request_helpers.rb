module RequestHelpers
  def json
    @json ||= JSON.parse(response.body)
  end
end

RSpec.shared_examples 'returns 200' do
  it { is_expected.to eq 200 }
end

RSpec.shared_examples 'returns 201' do
  it { is_expected.to eq 201 }
end

RSpec.shared_examples 'returns 400' do
  it { is_expected.to eq 400 }
end

RSpec.shared_examples 'returns 404' do
  it { is_expected.to eq 404 }
end
