# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  describe 'GET /categories#index' do
    let(:user) { User.create(name: 'John Doe', email: 'johndoe@gmail.com', password: 'john123') }
    before { sign_in user }

    it 'returns http success' do
      get categories_path
      expect(response).to have_http_status(:success)
    end

    it 'renders index template' do
      get categories_path
      expect(response).to render_template(:index)
    end
  end
end
