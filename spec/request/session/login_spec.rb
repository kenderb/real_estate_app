# frozen_string_literal: true

require 'rails_helper'

describe 'Login', type: :request do
  context 'When params are correct' do
    let(:password) { 'SomeP4sss@' }
    let(:user) { build(:user, password:, password_confirmation: password) }
    let(:params) do
      {
        email: user.email,
        password:
      }
    end

    before do
      user.confirm
    end

    it 'login user successfully if params are correct' do
      post user_session_path, params: params
      expect(response).to have_http_status(:success)
    end
  end

  context 'when params are incorrect' do
    let(:password) { 'SomeP4sss@' }
    let(:user) { build(:user, password:, password_confirmation: password) }
    let(:params) do
      {
        email: user.email,
        password: 'notCorrectPassword'
      }
    end

    it 'not login user successfully if params are incorrect' do
      post user_session_path, params:, as: :json

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
