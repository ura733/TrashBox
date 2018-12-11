require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user, name: 'userA', email: 'usera@example.com', password: 'password', password_confirmation: 'password')
  end

  context 'user validation' do
    it '値が入っている場合' do
      expect(@user).to be_valid
    end
    it 'nameがない空白' do
      @user.name = ''
      expect(@user).to be_invalid
    end
    it 'emailが空白' do
      @user.email = ''
      expect(@user).to be_invalid
    end
  end

  context 'email validation' do
    it '文字数が255字以上' do
      @user.email = 'a' * 244 + '@example.com'
      expect(@user).to be_invalid
    end

    it 'メールフォーマットに合っているか' do
      addresses = %w[user@example,com user_at_foo.org user.name@example.
                            foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |address|
        @user.email = address
        expect(@user).to be_invalid
      end
    end

    it 'メールアドレスが一意になっているか' do
      duplicate_user = @user.dup
      @user.save
      expect(duplicate_user).to be_invalid
    end
  end

  context 'name validation' do
    it '文字数が50字以上' do
      @user.name = 'a' * 51
      expect(@user).to be_invalid
    end
  end

  context 'password validation' do
  it '文字数が6字未満' do
    @user.password = 'aaaaa'
    @user.password_confirmation = @user.password
    expect(@user).to be_invalid
  end
  end
end
