class Admin::ItemsController < ApplicationController
before_action :authenticate_admin!
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
      @items = Item.order(:id).page(params[:page])
      @item = Item.new
    end

    def show
      @item = Item.find(params[:id])
      @genre = Genre.find(@item.genre_id)
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
