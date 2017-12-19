require 'test_helper'

class NewArticleTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.create(username: "joe", email: "joe@example.com", password: "password", admin: true)
	end

	test "Article creating test" do
		sign_in_as(@user,"password")
		get new_article_path
		assert_template 'articles/new'
		assert_difference 'Article.count', 1 do
			post articles_path, params: {article: {title: "Hello world", description: "Hello Everyone"}}
			follow_redirect!
		end
		assert_template 'articles/show'
		assert_match "Hello world", response.body
	end
end