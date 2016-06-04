class Order < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :items

  before_save do
    # raise "no items in order" if items.empty?
  end

  # scope :today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }
  def sum_order
    write_attribute :total, items.map(&:price).inject(:+)
    # sum = 0
    # items.each do |item|
    #   sum += item.price 
    # end
    # sum
  end

end
