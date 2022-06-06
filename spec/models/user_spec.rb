# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }
  let(:invalid_name_user) { build :user, name: '' }
  let(:invalid_email_user) { build :user, email: '' }
  let(:invalid_email_user2) { build :user, email: 'some text' }
  let(:original_user_email) { build :user, email: 'email@email.com' }
  let(:duplicated_user_email) { build :user, email: 'email@email.com' }

  it 'should create a user with a name' do
    expect(user.name).to_not be_nil
  end

  it 'should create a user with an email' do
    expect(user.email).to_not be_nil
    user.save
    expect(User.all.size).to eq 1
  end

  context 'validations' do
    it 'should create a user with a valid name and email' do
      expect(user).to be_valid
      user.save
      expect(User.all.size).to eq 1
    end

    it 'should not create a user with an empty name' do
      expect(invalid_name_user).to_not be_valid
      expect { invalid_name_user.save! }.to raise_error(/Name can't be blank/)
      expect(User.all.size).to eq 0
    end

    it 'should not create a user with an empty email' do
      expect(invalid_email_user).to_not be_valid
      expect { invalid_email_user.save! }.to raise_error(/Email can't be blank/)
    end

    it 'should not create a user with an invalid email' do
      expect(invalid_email_user2).to_not be_valid
    end

    it 'should not create a user with a taken email' do
      original_user_email.save
      expect(duplicated_user_email).to_not be_valid
      expect { duplicated_user_email.save! }.to raise_error(/Email has already been taken/)
    end
  end
end
