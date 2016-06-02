class Item < ActiveRecord::Base
  validates :name, :course, length: { maximum: 200 }
  validates :name, :price, :course, presence: true
  validates :price, numericality: { greater_than: 0}
  
  has_and_belongs_to_many :orders

  scope :today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }

  def name_with_price
    "#{name} - price: #{price}$"
  end
end
