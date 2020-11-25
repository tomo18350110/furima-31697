require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail,passwordとpassword_confirmation,last_nameとfirst_name,last_name_kanaとfirst_name_kanとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      context '新規登録がうまくいかない時' do
        it 'nicknameが空だと登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'emailが一意性であると登録できない' do
          user = FactoryBot.create(:user, email: 'i@i')
          another_user = FactoryBot.build(:user, email: 'i@i')
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailに@がない場合登録できない' do
          @user.email = 'testtest'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it 'passwordが空では登録できない' do
          @user.password = nil
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordが5文字以下であれば登録できない' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordとpassword_confirmationの値が一致しなければ登録できない' do
          @user.password = 'a23456'
          @user.password_confirmation = 'a12345'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'paswordが存在してもpassword_confirmationが空では登録できない' do
          @user.password = 'a11111'
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'last_nameが空では登録できない' do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
        it 'last_name_kanaが空では登録できない' do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'birthdayが空では登録できない' do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
        it 'first_nameが全角でなければ登録できない' do
          @user.first_name = "toshiki"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
        end
        it 'last_nameが全角でなければ登録できない' do
          @user.last_name = "iyo"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
        end
        it 'first_name_kanaが全角カナでないと登録できない' do
          @user.first_name_kana = "としき"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
        end
        it 'last_name_kanaが全角カナでないと登録できない' do
          @user.last_name_kana = "いよ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
        end
      end
    end
  end
end

