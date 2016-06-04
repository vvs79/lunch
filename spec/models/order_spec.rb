require 'rails_helper'

describe Order do

  it "total order cost " do
  	item1 = create(:item)
    item2 = create(:item, course: "2")
    item3 = create(:item, course: "3")

    order = create(:order, item_ids: [item1.id, item2.id, item3.id])

    order.sum_order
    expect(order.total).to eq(33)

  end

end
