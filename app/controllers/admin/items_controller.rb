class Admin::ItemsController < ApplicationController
    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      @item.save
    end

    def index
      @items = Item.all
    end

    def show
      @item = Item.find(params[:id])
    end

    def edit
    end

    def update
    end

    private
    def item_params
        params.require(:item).permit(:genre_id, :name, :description, :price, :item_image, :is_selling)
    end
end
