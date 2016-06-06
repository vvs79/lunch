require 'rails_helper'

describe OrdersController do
  include Devise::TestHelpers

  before(:each) do
    user = create(:user)
    sign_in user
  end

  describe "show action" do
  
    it "renders show template if order is found" do
      user = create(:user)
      sign_in user
      item1 = create(:item)
      item2 = create(:item, course: "2")
      item3 = create(:item, course: "3")
      order = create(:order, item_ids: [item1.id, item2.id, item3.id], user_id: user.id)
      get :show, id: order.id
      expect(response).to render_template('show')
    end

    it "redirect to action index if order is not found" do
      order = create(:order)
      get :show, id: order.id
      expect(response).to redirect_to(orders_path)
    end

  end

  describe "destroy action" do
  
    it "redirect to back if order is destroyed" do
      item1 = create(:item)
      item2 = create(:item, course: "2")
      item3 = create(:item, course: "3")
      order = create(:order, item_ids: [item1.id, item2.id, item3.id])
      delete :destroy, id: order.id
      expect(response).to redirect_to(orders_path)
    end

  end

end
