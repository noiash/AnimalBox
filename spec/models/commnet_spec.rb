require 'rails_helper'

RSpec.describe "Commentモデルのテスト", type: :model do
  describe 'バリデーションのテスト' do
    it 'ユーザー、投稿ID、コメントがある場合有効である' do
      expect(FactoryBot.build(:comment)).to be_valid
    end
    it 'コメントがない場合、無効である' do
      expect(FactoryBot.build(:comment, comment: nil)).to_not be_valid
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end
end