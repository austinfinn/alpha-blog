require 'test_helper'

class SignUpTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.new(username: "john", email: "john@example.com", password: "password")
  end
  
  test "User can successfully create an account" do
    get signup_path
    assert_template 'users/new'
    
    assert_difference('User.count', 1) do
      post_via_redirect(users_path, user: {username: "test_John", email: "john@example.com", password: "password"})
    end
    
    assert_match 'test_John', response.body
    assert_template 'users/show'
  end
end