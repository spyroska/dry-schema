RSpec.describe 'Schema with negated rules' do
  subject(:schema) do
    Dry::Schema.define do
      required(:tags) { !empty? }
    end
  end

  describe '#messages' do
    before do
      pending "negation is not supported yet"
    end

    it 'passes with valid input' do
      expect(schema.(tags: %w(a b c))).to be_success
    end

    it 'fails with invalid input' do
      expect(schema.(tags: []).errors).to eql(tags: ['cannot be empty'])
    end
  end
end
