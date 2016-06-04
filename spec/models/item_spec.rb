require 'rails_helper'

describe Item do

  it "name is not empty" do
    item = Item.new(name: '')
    item.valid?
    item.errors[:name].should_not be_empty
  end

  it "price is not empty" do
    item = Item.new(price: 0)
    item.valid?
    item.errors[:price].should_not be_empty
  end

  it "course is not empty" do
    item = Item.new(course: '')
    item.valid?
    item.errors[:course].should_not be_empty
  end

end
