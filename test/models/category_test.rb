require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup
    @category = Category.new(name: "sports")
  end
  
  test "category should be valid" do
    assert @category.valid?
  end

  test "category is not empty or blank" do
    @category.name = ""
    assert_not @category.valid?
  end
  
  test "category is unique" do
    @category.save
    @category2 = Category.new(name: "sports")
    assert_not @category2.valid?
  end
  
  test "category name can not be too long" do 
    @category.name = "x" * 31
    assert_not @category.valid?
  end

  test "category name can not be too short" do 
    @category.name = "xx"
    assert_not @category.valid?
  end

end