class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin, only: [:new, :create, :index]

  def index
    @items = Item.all.order(id: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_item_path
    else
      render 'new'
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :price, :course)
    end
end
