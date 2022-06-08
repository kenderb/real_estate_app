module RequestSpecHelper
  def json
    json_response = JSON.parse(response.body)
    json_response.is_a?(Hash) ? json_response.with_indifferent_access : json_response
  end

  def signing
    user = create(:user, password: 'Fu11.P4$$W0rd!', password_confirmation: 'Fu11.P4$$W0rd!')
    post '/auth/sign_in', params: { email: user.email, password: 'Fu11.P4$$W0rd!' }
    { 'access-token': response.header['access-token'], client: response.header['client'], uid: response.header['uid'] }
  end

  def sign_out(headers)
    delete '/auth/sign_out', headers:
  end

  def auth_headers
    user.create_new_auth_token
  end
end
