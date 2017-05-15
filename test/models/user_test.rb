require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # test 'invalid with nothing' do
  #   user = User.new(email: 'john@example.com')
  #   refute user.valid?, 'user is valid without a name'
  #   assert_not_nil user.errors[:name], 'no validation error for name present'
  # end

  test 'invalid with email only' do
    user = User.new(email: "aa@akn.csnksd");
    refute user.valid?, 'user is valid with email only'
    assert_not_nil user.errors[:email], 'no validation error for email'
  end

  test 'invalid with password' do

  end

end
