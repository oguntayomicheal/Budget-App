require 'rails_helper'

RSpec.feature 'Categories index Page', type: :feature do
    let(:user) { User.create!(name: 'Jane Doe', email: 'janedoe@gmail.com', password: 'jane123') }
    let(:category) { user.categories.create(name: 'Test Category') }
    
    before { sign_in user }

    it 'viewing categories index page' do
        visit categories_path
    
        expect(page).to have_selector('h1', text: 'Categories')


      end

      it 'adding a new category' do
        visit categories_path
    
        click_link 'Add new category'
    
        expect(page).to have_current_path(new_category_path)
      end
    
end
