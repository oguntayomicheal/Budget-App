require 'rails_helper'

RSpec.feature 'Products index Page', type: :feature do
  let(:user) { User.create!(name: 'Jane Doe', email: 'janedoe@gmail.com', password: 'jane123') }
  let(:category) { user.categories.create(name: 'Test Category') }
  let(:transaction1) { category.products.create!(name: 'Transaction 1', amount: 100, user:) }
  let(:transaction2) { category.products.create!(name: 'Transaction 2', amount: 50, user:) }

  before { sign_in user }

  it 'viewing products or transactions index page' do
    visit category_products_path(category)

    expect(page).to have_selector('h1', text: 'Transactions')
  end

  it 'adding a new transactions' do
    visit category_products_path(category)

    click_link 'Add transactions'

    expect(page).to have_current_path(new_category_product_path(category))
  end
end
