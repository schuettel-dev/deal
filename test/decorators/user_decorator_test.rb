require 'test_helper'

class UserDecoratorTest < ActiveSupport::TestCase
  test '#initials' do
    assert_equal '', User.new.decorate.initials
    assert_equal 'M', User.new(full_name: 'Michael').decorate.initials
    assert_equal 'M', User.new(full_name: 'michael').decorate.initials
    assert_equal 'MS', User.new(full_name: 'Michael Scott').decorate.initials
    assert_equal 'MS', User.new(full_name: 'michael scott').decorate.initials
    assert_equal 'PM', User.new(full_name: 'Prison Mike Scott').decorate.initials
    assert_equal 'PM', User.new(full_name: 'prison mike scott').decorate.initials
  end
end
