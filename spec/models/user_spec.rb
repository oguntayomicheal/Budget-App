# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = build(:user) 
    expect(user).to be_valid
  end

  context 'Testing Associations' do
    it 'has_many categories' do
      assoc = User.reflect_on_association(:categories)
      expect(assoc.macro).to eq :has_many
    end

    it 'has_many products' do
      assoc = User.reflect_on_association(:products)
      expect(assoc.macro).to eq :has_many
    end
  end

end
