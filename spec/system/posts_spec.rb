# frozen_string_literal: true

require 'rails_helper'

describe '投稿のテスト' do
  before do
    @user = FactoryBot.create(:user)
  end
  let!(:post) { create(:post, title: 'hoge', introduction: 'introduction') }
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }
  let(:profile_image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
  let(:profile_image) { Rack::Test::UploadedFile.new(image_path) }
  describe 'トップ画面(root_path)のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップ画面(root_path)に一覧ページへのリンクが表示されているか' do
        expect(page).to have_link ""
      end
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end

  describe '一覧画面のテスト' do
    before do
      sign_in @user
      visit new_post_path
    end
    context '表示の確認' do
      it 'new_post_pathが"/posts/new"であるか' do
        expect(current_path).to eq('/posts/new')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '投稿する'
      end
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'post[title]', with: Faker::Lorem.characters(number:10)
        fill_in 'post[introduction]', with: Faker::Lorem.characters(number:30)
        click_button '投稿する'
        expect(page).to have_current_path posts_path
      end
    end
  end

  describe "投稿一覧のテスト" do
    before do
      sign_in @user
      visit posts_path
    end
    context '表示の確認' do
      it '投稿されたものが表示されているか' do
        expect(page).to have_content post.title
        expect(page).to have_content post.introduction
      end
    end
  end

  describe '詳細画面のテスト' do
    before do
      sign_in @user
      @user.posts.build(title: Faker::Lorem.characters(number:10),
      introduction: Faker::Lorem.characters(number:30)).save
      visit post_path(@user.posts.first.id)
    end
    context '表示の確認' do
      it '削除リンクが存在しているか' do
        expect(page).to have_link '削除'
      end
      it '編集リンクが存在しているか' do
        expect(page).to have_link '編集'
      end
    end
    context 'リンクの遷移先の確認' do
      it '編集の遷移先は編集画面か' do
        expect(page).to have_link '編集'
        click_link '編集'
        expect(current_path).to eq("/posts/#{@user.posts.first.id}/edit")
      end
    end
    context 'post削除のテスト' do
      it 'postの削除' do
        expect { post.destroy }.to change { Post.count }.by(- 1)
      end
    end
  end

  describe '編集画面のテスト' do
    before do
      sign_in @user
      visit edit_post_path(post)
    end
    context '表示の確認' do
      it '編集前のタイトルと本文がフォームに表示（セット）されている' do
        expect(page).to have_field 'post[title]', with: post.title
        expect(page).to have_field 'post[introduction]', with: post.introduction
      end
      it '投稿するボタンが表示される' do
        expect(page).to have_button '投稿する'
      end
    end
    context '更新処理に関するテスト' do
      it '更新後のリダイレクト先は正しいか' do
        fill_in 'post[title]', with: Faker::Lorem.characters(number:10)
        fill_in 'post[introduction]', with: Faker::Lorem.characters(number:30)
        click_button '投稿する'
        expect(page).to have_current_path post_path(post)
      end
    end
  end
end