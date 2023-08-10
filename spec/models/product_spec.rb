require 'rails_helper'

RSpec.describe Product, type: :model do

  subject { Product.new(name: 'Food', amount: 20.0) }

  before { subject.save }

  describe 'validates name and amount' do
    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'amount should be a number' do
      subject.amount = 'a'
      expect(subject).to_not be_valid
    end

    it 'amount should be greater than or equal to zero' do
      subject.amount = -1
      expect(subject).to_not be_valid
    end
  end
  
  context 'Testing Associations' do
    it 'belongs_to categories' do
      assoc = Product.reflect_on_association(:category)
      expect(assoc.macro).to eq :belongs_to
    end

    it 'has_many category_products' do
      assoc = Product.reflect_on_association(:category_products)
      expect(assoc.macro).to eq :has_many
    end

    it 'has_many categories' do
      assoc = Product.reflect_on_association(:categories)
      expect(assoc.macro).to eq :has_many
    end
  end
end
