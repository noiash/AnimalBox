require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
  end
  describe "#index" do
    # 正常なレスポンスか？
    it "responds successfully" do
      sign_in @user
      get :index
      expect(response).to be_success
    end
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      sign_in @user
      get :index
      expect(response).to have_http_status "200"
    end
    it "アクセスに失敗するか" do
      get :index
      expect(response).to_not be_success
    end
    # 302レスポンスが返ってきているか？
    it "returns a 302 response" do
      get :index
      expect(response).to have_http_status "302"
    end
  end

  describe "#show" do
    before do
      @post = @user.posts.create(
      title: "タイトル",
      introduction: "本文",
      )
    end
    # 正常なレスポンスか？
    it "responds successfully" do
      sign_in @user
      get :show, params: {id: @post.id}
      expect(response).to be_success
    end
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      sign_in @user
      get :show, params: {id: @post.id}
      expect(response).to have_http_status "200"
    end
    it "アクセスに失敗するか" do
      get :show, params: {id: @post.id}
      expect(response).to_not be_success
    end
    # 302レスポンスが返ってきているか？
    it "returns a 302 response" do
      get :show, params: {id: @post.id}
      expect(response).to have_http_status "302"
    end
  end

  describe "#new" do
    # 正常なレスポンスか？
    it "responds successfully" do
      sign_in @user
      get :new
      expect(response).to be_success
    end
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      sign_in @user
      get :new
      expect(response).to have_http_status "200"
    end
    it "アクセスに失敗するか" do
      get :new
      expect(response).to_not be_success
    end
    # 302レスポンスが返ってきているか？
    it "returns a 302 response" do
      get :new
      expect(response).to have_http_status "302"
    end
  end

  describe "#create" do
    it "responds successfully" do
      sign_in @user
      post :create, params: {
        post: {
          title: "タイトル",
          introduction: "本文",
          image_id: 1,
          video_id: 1,
          tag_name: "タグ"
        }
      }
      expect(response).to have_http_status "302"
    end
    it "responds successfully" do
      sign_in @user
      post :create, params: {
        post: {
          title: "タイトル",
          introduction: "本文",
          image_id: 1,
          video_id: 1,
          tag_name: "タグ"
        }
      }
      expect(response).to have_http_status "302"
    end
    it "アクセスに失敗するか" do
      post :create, params: {
        post: {
          title: nil,
          introduction: "本文",
          image_id: 1,
          video_id: 1,
          tag_name: "タグ"
        }
      }
      expect(response).to_not be_success
    end
    # 302レスポンスが返ってきているか？
    it "returns a 302 response" do
      post :create, params: {
        post: {
          title: "タイトル",
          introduction: "本文",
          image_id: 1,
          video_id: 1,
          tag_name: "タグ"
        }
      }
      expect(response).to have_http_status "302"
    end
  end

  describe "#edit" do
    before do
      @post = @user.posts.create(
      title: "タイトル",
      introduction: "本文",
      )
    end
    # 正常なレスポンスか？
    it "responds successfully" do
      sign_in @user
      get :edit, params: {id: @post.id}
      expect(response).to be_success
    end
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      sign_in @user
      get :edit, params: {id: @post.id}
      expect(response).to have_http_status "200"
    end
    it "アクセスに失敗するか" do
      get :edit, params: {id: @post.id}
      expect(response).to_not be_success
    end
    # 302レスポンスが返ってきているか？
    it "returns a 302 response" do
      get :edit, params: {id: @post.id}
      expect(response).to have_http_status "302"
    end
  end

  describe "#update" do
    before do
      @post = @user.posts.create(
      title: "タイトル",
      introduction: "本文",
      )
    end
    # 正常なレスポンスか？
    it "responds successfully" do
      sign_in @user
      post_params = {
        title: "タイトル",
        introduction: "本文",
        image_id: 1,
        video_id: 1,
        tag_name: "タグ"
      }
      patch :update, params: {id: @post.id, post: post_params}
      expect(response).to have_http_status "302"
    end
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      sign_in @user
      post_params = {
        title: "タイトル",
        introduction: "本文",
        image_id: 1,
        video_id: 1,
        tag_name: "タグ"
      }
      patch :update, params: {id: @post.id, post: post_params}
      expect(response).to have_http_status "302"
    end
    it "アクセスに失敗するか" do
      post_params = {
        title: "タイトル",
        introduction: "本文",
        image_id: 1,
        video_id: 1,
        tag_name: "タグ"
      }
      patch :update, params: {id: @post.id, post: post_params}
      expect(response).to_not be_success
    end
    # 302レスポンスが返ってきているか？
    it "returns a 302 response" do
      post_params = {
        title: "タイトル",
        introduction: "本文",
        image_id: 1,
        video_id: 1,
        tag_name: "タグ"
      }
      patch :update, params: {id: @post.id, post: post_params}
      expect(response).to have_http_status "302"
    end
  end

  describe "#destroy" do
    before do
      @post = @user.posts.create(
      title: "タイトル",
      introduction: "本文",
      )
    end
    # 正常なレスポンスか？
    it "responds successfully" do
      sign_in @user
      delete :destroy, params: {id: @post.id}
      expect(response).to have_http_status "302"
    end
    # 200レスポンスが返ってきているか？
    it "returns a 200 response" do
      sign_in @user
      delete :destroy, params: {id: @post.id}
      expect(response).to have_http_status "302"
    end
    it "アクセスに失敗するか" do
      delete :destroy, params: {id: @post.id}
      expect(response).to_not be_success
    end
    # 302レスポンスが返ってきているか？
    it "returns a 302 response" do
      delete :destroy, params: {id: @post.id}
      expect(response).to have_http_status "302"
    end
  end

end