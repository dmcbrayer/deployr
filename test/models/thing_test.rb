require 'test_helper'

class ThingTest < ActiveSupport::TestCase
  test "name" do
    thing = things(:one)
    assert_equal "MyString", thing.name
  end

  test "description" do
    thing = things(:one)
    assert_equal "MyText", thing.description
  end
end
