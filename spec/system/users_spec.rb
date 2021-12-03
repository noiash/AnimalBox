require 'rails_helper'

describe 'ユーザー新規登録' do
  context '新規登録できる場合' do
    it '新規ユーザー登録画面に遷移する' do
      visit root_path
      click_button ('新規会員登録はこちら')
      expect(page).to have_current_path '/users/sign_up'
    end
  end
end