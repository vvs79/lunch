require 'rails_helper'

describe ItemsController do
  include Devise::TestHelpers

  before(:each) do
    user = create(:user)
    sign_in user
  end

  describe "create action" do

    it "redirect to back if item created" do
      post :create, item: {name: "item 1", price: 15, course: '1'}
      expect(response).to redirect_to(new_item_path)
    end

    it "renders new template if item didn't create" do
      post :create, item: {name: "item 1", price: 0, course: '1'}
      expect(response).to render_template('new')
    end

    it "redirect to orders index action if user is not admin" do
      user = create(:user, admin: false)
      sign_in user
      post :create, item: {name: "item 1", price: 15, course: '1'}
      expect(response).to redirect_to(orders_path)
    end

  end

end
