require 'rails_helper'

RSpec.describe Payment, type: :model do
  context 'validation tests' do
    first_user = User.create(name: 'Walid', email: 'walid1998k@gmail.com', password: 'walid1234')
    before(:each) do
      first_category = Category.create(name: 'Food', icon: 'icon.jpg', user_id: first_user.id)
      @payment = Payment.create(name: 'Tacos', amount: 60, user_id: first_user.id,
                                category_id: first_category.id)
    end

    it 'is invalid without a name' do
      @payment.name = nil
      expect(@payment).to_not be_valid
    end

    it 'is invalid without amount' do
      @payment.amount = nil
      expect(@payment).to_not be_valid
    end

    it 'amount must be a number' do
      @payment.amount = 'food'
      expect(@payment).to_not be_valid
    end

    it 'must have author ID' do
      @payment.user_id = nil
      expect(@payment).to_not be_valid
    end
  end
end
