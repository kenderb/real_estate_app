# frozen_string_literal: true

require 'rails_helper'

describe 'Sign out', type: :request do
  context 'When params are correct' do
    it 'Sign out user successfully if params are correct' do
      signing_headers_response = signing
      delete destroy_user_session_path, headers: signing_headers_response
      expect(response).to have_http_status(:success)
    end
  end
end
