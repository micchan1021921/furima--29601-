require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
describe 'ユーザー新規登録' do

  context '新規登録がうまくいくとき' do
    it "nickname、email、password、first_name、first_name_kana、last_name、last_name_kana、birth_dateが存在すれば登録できる" do
      expect(@user).to be_valid
    end
  end

  context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに@を含んでいないと登録できない"do
      @user.email = "abc.def"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "a1234"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが半角数字のみの場合登録できない"do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが半角英字のみの場合登録できない" do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "passwordが全角英数字の場合登録できない" do
      @user.password = "ａｉｕｅｏ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "password_confirmationがpasswordと異なると登録できない" do
      @user.password_confirmation = "password"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
    it "last_nameが空では登録できない"do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが全角でなければ登録できない"do
      @user.last_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "first_nameが全角でなければ登録できない"do
      @user.first_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "last_name_kanaが空では登録できない"do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "last_name_kanaが全角(カタカナ)でなければ登録できない"do
      @user.last_name_kana = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "first_name_kanaが全角(カタカナ)でなければ登録できない" do
      @user.first_name_kana = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "birh_dateが空では登録できない"do
    @user.birth_date = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
   end
  end
end