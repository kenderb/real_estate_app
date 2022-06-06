require "rails_helper"

RSpec.describe User, type: :model do
    let(:user) { build :user }
    let(:invalid_name_user) { build :user, name:''}

    it 'should create a user with a valid name' do
        expect(user).to be_valid
        user.save
        expect(User.all.size).to eq 1
    end

    it "should not create a user with a invalid name" do
        expect(invalid_name_user).to_not be_valid
        expect { invalid_name_user.save! }.to raise_error(/Name can't be blank/)
        expect(User.all.size).to eq 0
    end
end     