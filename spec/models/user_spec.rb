require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nicknameを入力してください")
    end

    it "emailが空では登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it "@を含まないemailは登録できないこと" do
      @user.email = "test.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it "passwordが空では登録できないこと" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "1234a"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end

    it "passwordがアルファベットのみであれば登録できないこと" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードis Invalid. Input including letters and numbers")
    end

    it "passwordが数字のみであれば登録できないこと" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードis Invalid. Input including letters and numbers")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last nameを入力してください")

    end

    it "last_nameが全角文字でないと登録できないこと" do
      @user.last_name = "last"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last namefull-width characters")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First nameを入力してください")
    end

    it "first_nameが全角文字でないと登録できないこと" do
      @user.first_name = "first"
      @user.valid?
      expect(@user.errors.full_messages).to include("First namefull-width characters")
    end

    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanaを入力してください")
    end

    it "last_name_kanaが全角カタカナ以外では登録できないこと" do
      @user.last_name_kana = "last"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanafull-width katakana characters")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanaを入力してください")
    end

    it "first_name_kanaが全角カタカナ以外では登録できないこと" do
      @user.first_name_kana = "first"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanafull-width katakana characters")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthdayを入力してください")
    end
  end
end
