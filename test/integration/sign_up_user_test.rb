require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
	end

	test "get new singup user form and create user" do
		sign_in_as(@user,"password")
		get signup_path
		assert_template 'users/new'
		assert_difference 'User.count', 1 do
			post users_path, params: {user: {username: "joe", email: "joe@example.com", password: "password"}}
			follow_redirect!
		end
		assert_template 'users/show'
		assert_match "joe", response.body
	end
end