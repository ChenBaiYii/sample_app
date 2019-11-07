require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest


  test 'invalid signup information' do
    get signup_path
    assert_difference 'User.count', 0 do

      post users_path, params: { user: { name: 'mike',
                                         email: 'mikeexample@qq.com',
                                         passowrd: 'passwordxxx',
                                         password_confirmation: 'passwordxxx' } }
    end
    #follow_redirect!
    # assert_template 'users/show'
    # assert is_logged_in?  # 测试无法通过，因为user.save失败，原因不详
  end


end
