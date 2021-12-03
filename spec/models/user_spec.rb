require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  it "有効な状態であるか" do
    expect(@user).to be_valid
  end

  it "nameがなければ無効な状態であること" do
    user = User.new(name: nil)
    expect(user).to be_invalid
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "メールアドレスがなければ無効であること" do
    user = User.new(email: nil)
    expect(user).to be_invalid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "重複したメールアドレスなら無効であること" do
    user = User.new(email: "test@user")
    expect(user).to be_invalid
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "メールアドレスが小文字化されていること" do
    mixed_case_email = "TARO@com"
    @user.email = mixed_case_email
    @user.save
    expect(@user[:email]).to eq("taro@com")
  end

  it "メールアドレスの一貫性の検証" do
    user = User.create(name: "Tako", email: "test@user")
    expect(user).to_not be_valid
    expect(user.errors[:email]).to include("has already been taken")
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end

end