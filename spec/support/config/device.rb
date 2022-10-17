require 'devise'

OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:facebook] = {
  'uid' => Array.new(9) { FFaker::Random.rand(1..9) }.join,
  'provider' => 'facebook',
  'credentials' => {
    'token' => FFaker::Lorem.characters(50),
    'secret' => FFaker::Lorem.characters(10)
  },
  'extra' => {
    'raw_info' => {
      'name' => FFaker::Name.name,
      'username' => FFaker::Name.last_name,
      'email' => FFaker::Internet.free_email
    }
  }
}

OmniAuth.config.add_mock(:facebook, OmniAuth.config.mock_auth[:facebook])
