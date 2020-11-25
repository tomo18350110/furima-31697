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
      it 'emailに@が必要である事' do
        @user.email = 'qqq@qqq'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上である事' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00000'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合である事' do
        @user.password = 'a11112'
        @user.password_confirmation = 'a11112'
        expect(@user).to be_valid
      end
      it 'ユーザーの本名は全角での入力である事' do
        @user.last_name = '田中'
        @user.first_name = '高貴'
        expect(@user).to be_valid
      end
      it 'userの本名のフリガナは全角(カタカナ)での入力である事' do
        @user.last_name_kana = 'タナカ'
        @user.first_name_kana = 'コウキ'
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
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
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
      end
    end
  end
end
