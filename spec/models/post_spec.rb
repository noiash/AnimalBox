# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, 'モデルのテスト', type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  let(:post) { FactoryBot.create(:post) }
  describe '実際に保存してみる' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:post)).to be_valid
    end
  end
  context '空白の空白のバリデーションチェック' do
    it 'titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      post = Post.new(title: '', introduction: 'hoge')
      expect(post).to be_invalid
      expect(post.errors[:title]).to include("can't be blank")
    end
    it 'introductionが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか' do
      post = Post.new(title: 'hoge', introduction: '')
      expect(post).to be_invalid
      expect(post.errors[:introduction]).to include("can't be blank")
    end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end