class Admin::ItemsController < ApplicationController
    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to admin_item_path(@item)
      else
        render 'new'
      end
    end

    def index
      @items = Item.all
    end

    def show
      @item = Item.find(params[:id])
    end

    def edit
      @item = find_item_by_id
    end

    def update
      @item = find_item_by_id
      @item.update(item_params)
      redirect_to admin_item_path
    end

    private
    def item_params
        params.require(:item).permit(:genre_id, :name, :description, :price, :item_image, :is_selling)
    end
    def find_item_by_id
        Item.find(params[:id])
    end
end
