# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }
  let(:invalid_name_user) { build :user, name: '' }
  let(:invalid_email_user) { build :user, email: '' }
  let(:invalid_password_user) { build :user, password: '' }
  let(:invalid_nickname_user) { build :user, nickname: '' }
  let(:invalid_email_user2) { build :user, email: 'some text' }
  let(:original_user_email) { build :user, email: 'email@email.com' }
  let(:duplicated_user_email) { build :user, email: 'email@email.com' }
  let(:original_user_nickname) { build :user, nickname: 'name' }
  let(:duplicated_user_nickname) { build :user, nickname: 'name' }


  context 'creation' do
    it 'should create an user with a name' do
      expect(user.name).to_not be_nil
    end

    it 'should create an user with an email' do
      expect(user.email).to_not be_nil
      user.save
      expect(User.all.size).to eq 1
    end

    it 'should create an user with a name' do
      expect(user.nickname).to_not be_nil
    end

    it 'should create an user with a password' do
      expect(user.password).to_not be_nil
    end
  end

  context 'validations' do
    it 'should create a user with a valid name and email' do
      expect(user).to be_valid
      user.save
      expect(User.all.size).to eq 1
    end

    it 'should not create an user with an empty nickname' do
      expect(invalid_nickname_user).to_not be_valid
      expect { invalid_nickname_user.save! }.to raise_error(/Nickname can't be blank/)
      expect(User.all.size).to eq 0
    end

    it 'should not create an user with an empty email' do
      expect(invalid_email_user).to_not be_valid
      expect { invalid_email_user.save! }.to raise_error(/Email can't be blank/)
    end

    it 'should not create an user with an invalid email' do
      expect(invalid_email_user2).to_not be_valid
    end

    it 'should not create an user with a taken email' do
      original_user_email.save
      expect(duplicated_user_email).to_not be_valid
      expect { duplicated_user_email.save! }.to raise_error(/Email has already been taken/)
    end

    it 'should not create an user with a taken nickname' do
      original_user_nickname.save
      expect(duplicated_user_nickname).to_not be_valid
      expect { duplicated_user_nickname.save! }.to raise_error(/Nickname has already been taken/)
    end

    it 'should not create an user with an invalid password' do
      expect(invalid_password_user).to_not be_valid
    end
  end
end
