require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @test_username = 'austin2016'
    @test_email = 'austin2016@example.com'
    @test_password = 'pass123'
  end
  
  test "New user account can be saved when all data is entered correctly" do
    @user = User.new(username: @test_username, email: @test_email, password: @test_password)
    assert @user.valid?
  end
  
  test "Username can not be empty" do
    @user = User.new(username: "", email: @test_email, password: @test_password)
    assert_not @user.save
  end
  
  test "Username can not be less than 3 characters long" do 
    @user = User.new(username: "aa", email: @test_email, password: @test_password)
    assert_not @user.save
  end
  
  test "Username can not be more than 25 characters long" do 
    temp_username = "a" * 26
    @user = User.new(username: temp_username, email: @test_email, password: @test_password)
    assert_not @user.save
  end
end