require "rails_helper"

RSpec.describe User, type: :model do
    let(:user) { build :user }

    it "is valid with valid attributes" do
        expect(User.new).to be_valid
    end

    it 'should have a name' do
        expect(user).to be_valid
    end
end