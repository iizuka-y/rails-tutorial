require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do #新規登録が失敗した時用のテスト
    get signup_path #ユーザー登録ページにアクセス
    assert_no_difference 'User.count' do #User.countでユーザー数が変わっていなければ(ユーザー生成失敗)true、変わってなければfalse
      post users_path, params: { user: { name:  "", #signup_pathからusers_pathに対してpostリクエスト送信(/usersへ)、paramsでuserハッシュとその下のハッシュで値を受け取れるかを確認
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end
