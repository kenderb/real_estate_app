require 'rails_helper'

describe 'Create', type: :request do
  context 'When params are correct' do
    let(:params) do
      {
        nickname: 'test',
        email: 'test@email.com',
        password: 'password',
        password_confirmation: 'password'
      }
    end

    it 'register user successfully with correct params' do
      post user_registration_path, params: params, as: :json

      expect(response).to have_http_status(:success)
      expect(User.all.size).to eq 1
    end
  end

  context 'When params are incorrect' do
    let(:params) do
      {
        nickname: 'test',
        email: 'test@email.com',
        password: '',
        password_confirmation: ''
      }
    end

    it 'not register user successfully with no password' do
      post user_registration_path, params:, as: :json

      expect(response).to have_http_status(:unprocessable_entity)
      expect(User.all.size).to eq 0
    end
  end
end
