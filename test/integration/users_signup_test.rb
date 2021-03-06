require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "valid signup submit" do
    @user = User.find_by(email:'teste@testeexemplo.com')

    if @user != nil then
      User.destroy(@user.id)
    end

    get signup_path
    assert_difference 'User.count',1 do
      post_via_redirect users_path, user: {
        name: "TesteExemplo",
        email: "teste@testeexemplo.com",
        password: "123456",
        password_confirmation: "123456"
      }
    end
    assert_template 'sessions/new'

  end
end
