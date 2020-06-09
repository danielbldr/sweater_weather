require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end

  describe 'class methods' do
    it 'can set api key' do
      new_user = User.create!(email: 'example@example.com', password: 'password',
                              password_confirmation: 'password')
      new_user.save
      
      user = User.last

      expect(user.api_key.length).to eq(24)
    end
  end
end
