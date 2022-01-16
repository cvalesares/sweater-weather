require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:api_key)}
    it {should validate_uniqueness_of(:api_key)}
    it {should validate_presence_of(:password)}
  end

  describe "methods" do
    describe "generate_api_key" do
      it 'can generate a random string' do
        api_key = User.generate_api_key
        api_key2 = User.generate_api_key

        expect(api_key).to be_a String
        expect(api_key.length).to eq(50)
        expect(api_key).not_to eq(api_key2)
      end
    end
  end
end
