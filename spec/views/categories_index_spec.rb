require 'rails_helper'
RSpec.describe 'Categories index Page', type: :feature do
  scenario 'displays all categories information' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: '111111')
    category1 = Categories.create(name: 'Category 1', user_id: user.id)

    visit categories_path
    expect(page).to have_content('Cat1')

  end
end
