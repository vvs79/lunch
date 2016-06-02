class Order < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :items

  # scope :today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }
  def sum_order
    sum = 0
    items.each do |item|
    	sum += item.price 
    end
    sum
  end

end
