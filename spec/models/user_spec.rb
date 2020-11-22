require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまく行く時' do
      it 'nickname, password, password_confirmation, email, last_name, first_name, last_name_kana, first_name_kana, birth_dateがあれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字があれば登録できる' do
        @user.password = 'aaA111'
        @user.password_confirmation = 'aaA111'
        expect(@user).to be_valid
      end
      it 'ユーザー本名が全角（漢字、ひらがな、カタカナ）であれば登録できる' do
        @user.last_name = '森,もり,モリ'
        @user.first_name = '森,もり,モリ'
        expect(@user).to be_valid
      end
      it 'ユーザー本名のフリガナが全角（カタカナ）であれば登録できる' do
        @user.last_name_kana = 'モリ'
        @user.first_name_kana = 'モリ'
        expect(@user).to be_valid
      end
      it 'birth_dateがあれば登録できる' do
        @user.birth_date = '0000-00-00'
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが半角英数字でなければ登録できない' do
        @user.password = 'aaaaaa'
        # binding.pry
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名が全角（漢字、ひらがな、カタカナ）でなければ登録できない' do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'ユーザー本名が全角（漢字、ひらがな、カタカナ）でなければ登録できない' do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'ユーザー本名のフリガナが全角（カタカナ）でなければ登録できない' do
        @user.last_name_kana = '森,もり,mori'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'ユーザー本名のフリガナが全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = '森,もり,mori'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'birth_dateがなければ登録できない' do
        @user.birth_date = '0000-00-00'
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
