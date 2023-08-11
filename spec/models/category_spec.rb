# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { Category.new(name: 'Test Category') }

  before { subject.save }

  describe 'validations' do
    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'belongs_to a user' do
      assoc = Category.reflect_on_association(:user)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'has_many category_products' do
      assoc = Category.reflect_on_association(:category_products)
      expect(assoc.macro).to eq :has_many
    end

    it 'has_many products' do
      assoc = Category.reflect_on_association(:products)
      expect(assoc.macro).to eq :has_many
    end
  end
end
