require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let(:user) { create(:user) }
  describe 'ログイン前' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it '会員登録が成功する' do
          visit new_user_registration_path
          fill_in 'user[email]', with: 'test@test'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button 'Sign up'
          expect(current_path).to eq('/posts')
        end
      end
    end
  end
end